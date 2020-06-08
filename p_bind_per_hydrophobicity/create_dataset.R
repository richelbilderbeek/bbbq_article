suppressMessages(library(ggplot2))
suppressMessages(library(dplyr))
library(testthat)

peptides_filename <- "peptides.csv"
expect_true(file.exists(peptides_filename))
df <- readr::read_csv(peptides_filename)
df$is_tmh <- NA
df$binds_mhc1 <- NA
df$binds_mhc2 <- NA
df

n_rows <- nrow(df)

for (i in seq_len(n_rows)) {
  sequence <- df$sequence[i]
  df$is_tmh[i] <- pureseqtmr::is_tmh(sequence)
  df$binds_mhc1[i] <- bbbq::is_detected_by_mhc_1(sequence)
  # df$binds_mhc2[i] <- bbbq::is_detected_by_mhc_2(sequence)
}

readr::write_csv(df, "p_bind_per_hydrophobicity.csv")
