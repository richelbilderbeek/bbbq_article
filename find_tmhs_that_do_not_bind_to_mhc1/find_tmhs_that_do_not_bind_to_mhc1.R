# Find a TMH that does not bind to MHC-I

suppressMessages(library(testthat))

df <- tibble::as_tibble(
  expand.grid(
    mhc_1_haplotype = bbbq::get_mhc1_haplotypes(),
    percentage = 0.0
  )
)

# How many polypeptides to try?
n <- 100

for (row_index in seq_len(nrow(df))) {
  mhc_1_haplotype <- df$mhc_1_haplotype[row_index]
  for (i in seq_len(n)) {
    protein_sequence <- bbbq::create_random_hydrophobic_polypeptide(n_aas = 30)
    is_tmh <- pureseqtmr::is_tmh(protein_sequence)
    does_bind <- bbbq::is_detected_by_mhc_1(
      protein_sequence = protein_sequence,
      mhc_1_haplotype = mhc_1_haplotype
    )
    if (is_tmh && !does_bind) {
      df$percentage[row_index] <- df$percentage[row_index] + (1.0 / n)
      message(
        "FOUND ONE!\n",
        "protein_sequence: ", protein_sequence, "\n",
        "mhc_1_haplotype: ", mhc_1_haplotype
      )
    }
  }
}
write.csv(df, file = "perc_tmhs_that_do_not_bind_to_mhc1.csv", row.names = FALSE)

