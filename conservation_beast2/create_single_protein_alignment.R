library(testthat)
library(dplyr)

proteomes_filename <- "allprot0621.fasta"
testthat::expect_true(file.exists(proteomes_filename))

proteomes_envelope_filename <- "allprot0621_envelopes.fasta"
message("'proteomes_envelope_filename': ", proteomes_envelope_filename)


proteome <- seqinr::read.fasta(proteomes_filename, seqtype = "AA", as.string = TRUE)

# Select the envelope genes
evelope_sequences <- proteome[stringr::str_which(names(proteome), "^E\\|")]

seqinr::write.fasta(
  evelope_sequences,
  names = names(evelope_sequences),
  file.out = proteomes_envelope_filename
)

