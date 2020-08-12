library(testthat)
library(dplyr)
library(ggplot2)
library(seqinr)

proteomes_envelope_filename <- "allprot0621_envelopes.fasta"
testthat::expect_true(file.exists(proteomes_envelope_filename))

proteome <- seqinr::read.fasta(proteomes_envelope_filename, seqtype = "AA", as.string = TRUE)

proteins <- proteome

message("number of proteins: ", length(proteins))
hist(getLength(proteins))

t <- tibble::tibble(length = getLength(proteins))

ggplot2::ggplot(t, aes(x = length)) +
  geom_histogram(binwidth = 1) +
  scale_y_continuous(limits = c(0, 10), breaks = seq(0, 10)) +
  ggtitle("WARNING: Removes two lengths")

sum(getLength(proteins) == 71)
sum(getLength(proteins) == 72)
sum(getLength(proteins) == 73)
sum(getLength(proteins) == 74)
sum(getLength(proteins) == 75)
sum(getLength(proteins) == 76)
sum(getLength(proteins) == 77)

proteins_of_same_length <- proteome[getLength(proteins) == 75]
message("number of proteins of same length: ", length(proteins_of_same_length))

all(getLength(proteins_of_same_length) == 75)

unique_proteins_of_same_length <- proteins_of_same_length[
  !duplicated(getSequence(proteins_of_same_length))
]

message("number of unique proteins of same length: ", length(unique_proteins_of_same_length))


clean_unique_proteins_of_same_length <- unique_proteins_of_same_length[
  stringr::str_count(
    unlist(getSequence(unique_proteins_of_same_length, as.string = TRUE)),
    "X"
  ) < 10
]





topology <- pureseqtmr::predict_topology_from_sequence(
  getSequence(clean_unique_proteins_of_same_length[1], as.string = TRUE)[[1]][[1]]
)
message("topology: ", topology)

# First 1
loc_1 <- stringr::str_locate(topology, "01")[1,2]
length_1 <- as.numeric(loc_1) - 1
# Last 1
loc_2 <- stringr::str_locate(topology, "10")[1,1]
length_2 <- as.numeric(loc_2 - loc_1) + 1
length_3 <- 75 - as.numeric(loc_2)

expect_equal(75, length_1 + length_2 + length_3)

alignment_1_seqs <- stringr::str_sub(
  unlist(
    getSequence(
      clean_unique_proteins_of_same_length,
      as.string = TRUE
    )
  ), start = 1, end = loc_1 - 1
)
expect_true(all(nchar(alignment_1_seqs) == length_1))


seqinr::write.fasta(
  sequences = alignment_1_seqs,
  names = names(clean_unique_proteins_of_same_length),
  file.out = "alignment_left.fasta"
)


alignment_2_seqs <- stringr::str_sub(
  unlist(
    getSequence(
      clean_unique_proteins_of_same_length,
      as.string = TRUE
    )
  ), start = loc_1, end = loc_2
)
expect_true(all(nchar(alignment_2_seqs) == length_2))


seqinr::write.fasta(
  sequences = alignment_2_seqs,
  names = names(clean_unique_proteins_of_same_length),
  file.out = "alignment_tmh.fasta"
)


alignment_3_seqs <- stringr::str_sub(
  unlist(
    getSequence(
      clean_unique_proteins_of_same_length,
      as.string = TRUE
    )
  ), start = loc_2 + 1, end = 75
)
expect_true(all(nchar(alignment_3_seqs) == length_3))


seqinr::write.fasta(
  sequences = alignment_3_seqs,
  names = names(clean_unique_proteins_of_same_length),
  file.out = "alignment_right.fasta"
)
