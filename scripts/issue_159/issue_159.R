# Compare the speed between TMHMM and PureseqTM
fasta_filename <- system.file("extdata", "UP000464024.fasta", package = "pureseqtmr")

testthat::expect_true(file.exists(fasta_filename))

system.time({tmhmm::predict_topology(fasta_filename = fasta_filename)})
system.time({pureseqtmr::predict_topology(fasta_filename = fasta_filename)})
