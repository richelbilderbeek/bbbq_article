suppressMessages(library(ggplot2))
suppressMessages(library(dplyr))
library(tidyr)
library(testthat)

n_substs <- 6
n_haplotypes <- length(bbbq::get_mhc1_haplotypes())

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

from_peptides <- readr::read_csv(peptides_filename)$peptide
n_from_peptides <- length(from_peptides)

# peptide before and after
n_to_peptides <- n_from_peptides * n_substs
peptides <- tibble(
  from = rep(
    from_peptides,
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
expect_equal(n_to_peptides, nrow(peptides))


from <- tibble(
  peptide_from = unique(peptides$from)
)
from <- from %>% expand(peptide_from, haplotype = bbbq::get_mhc1_haplotypes())
from <- from %>% expand(peptide_from, haplotype, mhc_class = "I")
from$ic50 <- predict_ic50s(
  peptides = from$peptide_from,
  haplotypes = from$haplotype,
  mhc_classes = from$mhc_class
)
expect_equal(n_from_peptides * n_haplotypes, nrow(from))
from

to <- tibble(
  peptide_to = peptides$to
)
to <- to %>% expand(peptide_to, haplotype = bbbq::get_mhc1_haplotypes())
to <- to %>% expand(peptide_to, haplotype, mhc_class = "I")
to$peptide_from <- rep(from$peptide_from, each = n_substs)
to$ic50 <- predict_ic50s(
  peptides = to$peptide_to,
  haplotypes = to$haplotype,
  mhc_classes = to$mhc_class
)
expect_equal(n_to_peptides * n_haplotypes, nrow(to))

merged <- merge(
  from,
  to,
  by = c("peptide_from", "haplotype", "mhc_class")
)
merged$haplotype.x == merged$haplotype.y

df <- tibble(
  from_peptide = merged$peptide_from,
  from_ic50 = merged$ic50.x,
  to_peptide = merged$peptide_to,
  to_ic50 = merged$ic50.y,
  haplotype = merged$haplotype,
  mhc_class = merged$mhc_class
)

readr::write_csv(df, "delta_ic50s_per_haplotype.csv")
