library(ggplot2)
library(testthat)
library(bbbq)
library(EpitopePrediction)
library(mhcnuggetsr)

# MHC-I haplotypes used in this study
mhc1_haplotypes <- get_mhc1_haplotypes()

n_aas <- 9
n_peptides <- 1000

# A tidy tibble
df <- tibble::as_tibble(
  expand.grid(
    tool = c("ep", "mhcn"),
    haplotype = mhc1_haplotypes,
    sequence = bbbq::create_random_peptides(n_peptides = n_peptides, n_aas = n_aas),
    ic50 = NA,
    stringsAsFactors = FALSE
  )
)
n_rows <- nrow(df)
for (i in seq_len(n_rows)) {
  df$ic50[i] <- bbbq::predict_ic50s_mhc1(
    protein_sequence = df$sequence[i],
    mhc_1_haplotype = df$haplotype[i],
    n_aas = n_aas,
    tool = df$tool[i]
  )$ic50
}
df
readr::write_csv(df, "ic50s.csv")
