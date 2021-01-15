library(bianchietal2017)
library(dplyr, warn.conflicts = FALSE)
library(ggplot2, quietly = TRUE)

#It is claimed that some eluates from Schellens et al., 2015,
#are derived from TMHs.

#Here we obtain the human reference proteome used:
t_proteome <- get_proteome(fasta_gz_filename = download_proteome())
names(t_proteome)

# The human reference proteome contains 20600 sequences.
testthat::expect_equal(nrow(t_proteome), 20600)


# Here we obtain the (unique) epitope sequences from Schellens et al., 2015:
t_schellens <- get_schellens_et_al_2015_sup_1(xlsx_filename = download_schellens_et_al_2015_sup_1())
epitope_sequences <- unique(t_schellens$epitope_sequence)

# There are 7897 unique epitope sequences.
testthat::expect_equal(7897, length(epitope_sequences))

# Here we look for the gene names and sequences for those epitopes that
# have exactly 1 match:

if (file.exists("matches.csv")) {
  t_matches <- readr::read_csv("matches.csv")
} else {
  t_matches <- tibble::tibble(
    epitope_sequence = epitope_sequences,
    n_matches = NA,
    gene_name = NA,
    sequence = NA
  )
  for (i in seq_len(nrow(t_matches))) {
    print(paste0(i, "/", nrow(t_matches)))
    matches <- stringr::str_which(
      string = t_proteome$sequence,
      pattern = t_matches$epitope_sequence[i]
    )
    t_matches$n_matches[i] <- length(matches)
    if (length(matches) == 1) {
      t_matches$sequence[i] <- t_proteome$sequence[matches]
      t_matches$gene_name[i] <- t_proteome$name[matches]
    }
  }
  readr::write_csv(t_matches, "matches.csv")
}
testthat::expect_true(file.exists("matches.csv"))
t_matches <- readr::read_csv("matches.csv")



# The distribution of matches per epitope sequence:
ggplot2::ggplot() + ggplot2::aes(t_matches$n_matches) +
  ggplot2::geom_histogram(binwidth = 1) + ggplot2::ggsave("n_matches_histogram.png", width = 7, height = 7)

#The question is, for unique mapping of an epitope onto the human reference proteome:
#are those epitopes indeed overlapping with a TMH?
t_unique_matches <- dplyr::filter(t_matches, n_matches == 1)
t_unique_matches$tmhmm_topology <- NA
t_unique_matches$pureseqtm_topology <- NA
readr::write_csv(t_matches, "unique_matches.csv")

for (i in seq_len(nrow(t_unique_matches))) {
  print(paste0(i, "/", nrow(t_unique_matches)))
  if (!is.na(t_unique_matches$pureseqtm_topology[i])) next
  t_unique_matches$pureseqtm_topology[i] <- pureseqtmr::predict_topology_from_sequence(
    protein_sequence = t_unique_matches$sequence[i]
  )
  readr::write_csv(t_matches, "unique_matches.csv")
}
if (1 == 2) {
  for (i in seq_len(nrow(t_unique_matches))) {
    print(paste0(i, "/", nrow(t_unique_matches)))
    if (!is.na(t_unique_matches$pureseqtm_topology[i])) next
    t_unique_matches$tmhmm_topology[i] <- tmhmm::run_tmhmm_on_sequence(
      protein_sequence = t_unique_matches$sequence[i]
    )
    print(t_unique_matches$tmhmm_topology[i])
    readr::write_csv(t_matches, "unique_matches.csv")
  }
}

if (1 == 2) {
  # Done for now
  #Zooming in on

  t_unique_matches$n_tmh <- pureseqtmr::count_n_tmhs(t_unique_matches$topology)
  t_unique_matches_with_tmh <- dplyr::filter(t_unique_matches, n_tmh > 0)

  # Locate the epitope sequence within the human protein sequence:

  stringr::str_locate(
    string = t_unique_matches$sequence[1],
    pattern = t_unique_matches$epitope_sequence[1]
  )
  stringr::str_locate(
    string = t_unique_matches$topology[4],
    pattern = "1*"
  )
}


