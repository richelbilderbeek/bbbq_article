# Chance of a transition
#
# Goal:
#
# To determine the chance of mutation that loses or acquires an epitope,
# while remaining TMH.
#
# Abbreviations:
#
# Abbr  |Full
# ------|-----------
# AA    |Amino acid
# AAs   |Amino acids
# Abbr  |Abbreviation
# TMH   |Transmembrane helix
# TMHs  |Transmembrane helices

# Setup

library(testthat)
library(pureseqtmr)
library(mhcnuggetsr)
library(bbbq)

expect_true(is_pureseqtm_installed())
expect_true(is_mhcnuggets_installed())

# Method

mhc_1_haplotype <- "HLA-A26-01"

# We need to pick a haplotype. I will pick 'HLA-A26-01', because 50 percent
# of its epitopes is a TMH. I got that info,
# from `find_tmhs_that_do_not_bind_to_mhc1/find_tmhs_that_do_not_bind_to_mhc1.csv`:

n <- 2

t <- tibble::tibble(
  peptide = replicate(n = n, bbbq::create_random_tmh(n_aas = 30)),
  p_transition = NA
)

for (i in seq_len(n)) {
  peptide <- t$peptide[i]
  expect_true(pureseqtmr::is_tmh(peptide))
  p <- bbbq::calc_p_det_tmh_mut(
    protein_sequence = peptide,
    mhc_1_haplotype = mhc_1_haplotype
  )
  t$p_transition[i] <- p
}

xs <- c(1,2,3)

readr::write_csv(x = xs)
