proteome_filename <- "UP000005640_9606.fasta.gz"
yes_filename <- "TMH-Bcell-elution.txt"
no_filename <- "non-TMH-Bcell-elution.txt"

testthat::expect_true(file.exists(proteome_filename))
testthat::expect_true(file.exists(yes_filename))
testthat::expect_true(file.exists(no_filename))

proteome <- seqinr::read.fasta(proteome_filename)

proteome_sequences <- unlist(seqinr::getSequence(proteome, as.string = TRUE))

# Use YES sequences
peptide_sequences <- stringr::str_to_lower(readr::read_lines(yes_filename))
length(peptide_sequences)
unique_peptide_sequences <- sort(unique(peptide_sequences))
length(unique_peptide_sequences)
head(unique_peptide_sequences)

hit_topologies <- rep(NA, length(unique_peptide_sequences))

for (i in seq_len(length(unique_peptide_sequences))) {
  message(i)
  peptide_sequence <- unique_peptide_sequences[i]
  indices <- stringr::str_which(string = proteome_sequences, pattern = peptide_sequence)
  message(peptide_sequence, ": ", paste(indices, collapse = ","))
  protein_sequence <- proteome_sequences[indices[1]]
  topology <- pureseqtmr::predict_topology_from_sequence(stringr::str_to_upper(protein_sequence))
  testthat::expect_equal(stringr::str_length(protein_sequence), stringr::str_length(topology))
  where <- stringr::str_locate(string = protein_sequence, pattern = peptide_sequence)
  hit_topologies[i] <- stringr::str_sub(topology, start = where[1,1], end = where[1,2])
  message(hit_topologies[i])
}
hit_topologies

hit <- stringr::str_which(string = hit_topologies, pattern = "1")
no_hit <- stringr::str_which(string = hit_topologies, pattern = "1", negate = TRUE)
length(hit)
length(no_hit)
