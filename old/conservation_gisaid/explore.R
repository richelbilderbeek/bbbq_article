
diversity_filename <- "nextstrain_ncov_global_gisaid_diversity.tsv"
testthat::expect_true(file.exists(diversity_filename))

genome_filename <- "sars_cov_2_reference_genome.fasta"
testthat::expect_true(file.exists(genome_filename))

t_diversity <- readr::read_tsv(
  diversity_filename,
  col_types = readr::cols(
    gene = readr::col_character(),
    position = readr::col_double(),
    events = readr::col_double()
  )
)

sequence <- seqinr::getSequence(seqinr::read.fasta(genome_filename), as.string = TRUE)

