library(dplyr, quietly = TRUE)
library(testthat)

peptides_filename <- "peptides.csv"
expect_true(file.exists(peptides_filename))
t <- readr::read_csv(
  peptides_filename,
  col_types = readr::cols(
    sequence = readr::col_character(),
    hydrophobicity = readr::col_double()
  )
)

mhc_haplotypes <- bbbq::get_mhc_haplotypes()
if (!peregrine::is_on_peregrine()) {
  mhc_haplotypes <- sample(mhc_haplotypes, size = 2)
}

t_binds <- tidyr::expand_grid(
  sequence = t$sequence,
  mhc_haplotype = bbbq::get_mhc_haplotypes(),
  percentile = bbbq::get_ic50_percentile_binder(),
  is_binder = NA
)

for (i in seq_len(nrow(t_binds))) {

  t_binds$is_binder[i] <- bbbq::is_detected(
    protein_sequence = t_binds$sequence[i],
    mhc_haplotype = t_binds$mhc_haplotype[i],
    fragment_length = 9,
    percentile = t_binds$percentile[i]
  )
}
t_binds

readr::write_csv(t_binds, "is_binder.csv")
