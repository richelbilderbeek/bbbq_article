# How many epitopes does COVID-19 have?
library(testthat)
library(ggplot2)

predict_n_epitopes <- function(fasta_filename) {
  expect_true(file.exists(fasta_filename))
  proteome <- protr::readFASTA(fasta_filename)

  df <- tibble::tibble(
    name = names(proteome),
    n_epitopes = NA,
    n_aas = NA
  )
  n_proteins <- length(proteome)
  for (i in seq_len(n_proteins)) {
    protein <- proteome[[i]]
    n_aas <- nchar(protein)
    n_epitopes <- nrow(EpitopePrediction::binders(protein))
    df$n_aas[i] <- n_aas
    df$n_epitopes[i] <- n_epitopes
  }
  df
}


df_original <- predict_n_epitopes(fasta_filename = "proteome.fasta")
df_original$proteome <- "origin"
df_recent <- predict_n_epitopes("recent_proteome.fasta")
df_recent$proteome <- "recent"

sum(df_original$n_aas)
sum(df_recent$n_aas)
sum(df_recent$n_aas) / sum(df_original$n_aas)

sum(df_original$n_epitopes)
sum(df_recent$n_epitopes)

sum(df_recent$n_epitopes) / (sum(df_recent$n_aas) / sum(df_original$n_aas))

df <- rbind(df_original, df_recent)
df


locatome_text <- tmhmm::run_tmhmm("proteome.fasta")

locatome_lines <- locatome_text[
  stringr::str_detect(
    locatome_text,
    pattern = "^>.*",
    negate = TRUE
  )
]
locatome_lines
n_non_tmh <- sum(stringr::str_count(locatome_lines, pattern = "(O|o|i|I)"))
n_tmh <- sum(stringr::str_count(locatome_lines, pattern = "(M|m)"))
n_tmh / (n_tmh + n_non_tmh)
