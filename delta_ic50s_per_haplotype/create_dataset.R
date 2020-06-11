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
n_substs <- 3
peptides <- tibble(
  from = rep(
    readr::read_csv(peptides_filename)$peptide,
    each = n_substs
  )
)
peptides$to <- NA
for (i in seq_len(nrow(peptides) / n_substs)) {
  from_index <- 1 + (i - 1) * n_substs
  to_index <- from_index + n_substs - 1
  expect_true(from_index >= 1)
  expect_true(to_index <= nrow(peptides))
  peptides$to[from_index:to_index] <- sample(
    bbbq::get_adjacent_sequences(peptides$from[from_index]),
    size = n_substs
  )
}
expect_true(all(!(peptides$from == peptides$to)))

from <- tibble(
  peptide = unique(peptides$from)
)
from <- from %>% expand(peptide, haplotype = bbbq::get_mhc1_haplotypes()[1:2])
from <- from %>% expand(peptide, haplotype, mhc_class = "I")
from$ic50 <- predict_ic50s(
  peptides = from$peptide,
  haplotypes = from$haplotype,
  mhc_classes = from$mhc_class
)
from

to <- tibble(
  peptide_from = peptides$from,
  peptide = peptides$to
)
to <- to %>% expand(peptide_from, peptide, haplotype = bbbq::get_mhc1_haplotypes()[1:2])
to <- to %>% expand(peptide_from, peptide, haplotype, mhc_class = "I")
to$ic50 <- predict_ic50s(
  peptides = to$peptide,
  haplotypes = to$haplotype,
  mhc_classes = to$mhc_class
)
to

from$peptide_from <- from$peptide

merged <- merge(
  from,
  to,
  by = c("peptide_from", "haplotype", "mhc_class")
)
merged$haplotype.x == merged$haplotype.y

df <- tibble(
  from_peptide = merged$peptide_from,
  from_ic50 = merged$ic50.x,
  to_peptide = merged$peptide.x,
  to_ic50 = merged$ic50.y,
  haplotype = merged$haplotype,
  mhc_class = merged$mhc_class
)

readr::write_csv(df, "delta_ic50s_per_haplotype.csv")
