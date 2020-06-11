suppressMessages(library(ggplot2))
suppressMessages(library(dplyr))
library(tidyr)
library(testthat)

predict_ic50s <- function(
  peptides,
  haplotypes,
  mhc_classes
) {
  n <- length(peptides)
  expect_equal(n, length(haplotypes))
  expect_equal(n, length(mhc_classes))
  ic50s <- rep(NA, n)
  for (i in seq_len(n)) {
    peptide <- peptides[i]
    mhcnuggets_options <- mhcnuggetsr::create_mhcnuggets_options(
      mhc_class =  mhc_classes[i],
      mhc = mhcnuggetsr::to_mhcnuggets_name(haplotypes[i])
    )
    mhcnuggetsr::check_mhcnuggets_options(mhcnuggets_options)
    ic50 <- mhcnuggetsr::predict_ic50(
      mhcnuggets_options = mhcnuggets_options,
      peptides = peptide
    )$ic50
    expect_equal(1, length(ic50))
    ic50s[i] <- ic50
  }
  ic50s
}

peptides_filename <- "peptides.csv"
expect_true(file.exists(peptides_filename))

# peptide before and after
peptides <- tibble(from = readr::read_csv(peptides_filename)$peptide)
peptides$to <- NA
for (i in seq_len(nrow(peptides))) {
  peptides$to[i] <- sample(
    bbbq::get_adjacent_sequences(peptides$from[i]),
    size = 1
  )
}


from <- tibble(peptide = peptides$from)
from <- from %>% expand(peptide, haplotype = bbbq::get_mhc1_haplotypes()[1:2])
from <- from %>% expand(peptide, haplotype, mhc_class = "I")
from$ic50 <- predict_ic50s(
  peptides = from$peptide,
  haplotypes = from$haplotype,
  mhc_classes = from$mhc_class
)
from

to <- tibble(peptide = peptides$to)
to <- from %>% expand(peptide, haplotype = bbbq::get_mhc1_haplotypes()[1:2])
to <- from %>% expand(peptide, haplotype, mhc_class = "I")
to$ic50 <- predict_ic50s(
  peptides = to$peptide,
  haplotypes = to$haplotype,
  mhc_classes = to$mhc_class
)
to

expect_equal(nrow(from), nrow(to))
expect_equal(from$haplotype, to$haplotype)
expect_equal(from$mhc_class, to$mhc_class)
df <- tibble(
  from_peptide = from$peptide,
  from_ic50 = from$ic50,
  to_peptide = to$peptide,
  to_ic50 = to$ic50,
  haplotype = from$haplotype,
  mhc_class = from$mhc_class
)

readr::write_csv(df, "delta_ic50s_per_haplotype.csv")
