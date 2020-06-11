# Creates peptides.csv

library(bbbq)
suppressMessages(library(dplyr))

n_aas <- 9

# 2: 1.5 minutes
# 100: 75 mins?
n_peptides <- 100 # per haplotype

t <- tibble::tibble(
  peptide = replicate(n = n_peptides, bbbq::create_random_peptide(n_aas = n_aas))
)

readr::write_csv(t, "peptides.csv")
