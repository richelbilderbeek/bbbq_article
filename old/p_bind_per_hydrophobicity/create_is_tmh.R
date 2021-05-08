library(dplyr, quietly = TRUE)
library(testthat)

peptides_filename <- "peptides.csv"
expect_true(file.exists(peptides_filename))

t_is_tmh <- readr::read_csv(
  peptides_filename,
  col_types = readr::cols(
    sequence = readr::col_character(),
    hydrophobicity = readr::col_double()
  )
)
t_is_tmh$is_tmh <- NA

for (i in seq_len(nrow(t_is_tmh))) {
  t_is_tmh$is_tmh[i] <- pureseqtmr::is_tmh(t_is_tmh$sequence[i])
}
t_is_tmh
readr::write_csv(t_is_tmh, "is_tmh.csv")
