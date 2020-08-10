library(testthat)
library(dplyr)

proteomes_filename <- "allprot0621.fasta"
testthat::expect_true(file.exists(proteomes_filename))

proteome <- seqinr::read.fasta(proteomes_filename, seqtype = "AA", as.string = TRUE)


evelope_sequences <- proteome[stringr::str_which(names(proteome), "^E\\|")]

seqinr::write.fasta(evelope_sequences, file.out = "allprot0621_envelopes.fasta")

