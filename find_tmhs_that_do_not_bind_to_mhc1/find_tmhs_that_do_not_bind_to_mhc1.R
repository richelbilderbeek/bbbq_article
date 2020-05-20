# Find a TMH that does not bind to MHC-I

suppressMessages(library(testthat))

while (1) {
  protein_sequence <- bbbq::create_random_hydrophobic_polypeptide(n_aas = 30)
  is_tmh <- pureseqtmr::is_tmh(protein_sequence)
  mhc_1_haplotype <- sample(bbbq::get_mhc1_haplotypes(), size = 1)
  does_bind <- bbbq::is_detected_by_mhc_1(
    protein_sequence = protein_sequence,
    mhc_1_haplotype = mhc_1_haplotype
  )
  if (is_tmh && !does_bind) {
    message(
      "FOUND ONE!\n",
      "protein_sequence: ", protein_sequence, "\n",
      "mhc_1_haplotype: ", mhc_1_haplotype
    )
    return()
  }
}
