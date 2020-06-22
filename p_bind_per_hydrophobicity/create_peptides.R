# Creates peptides.csv

library(bbbq)
library(dplyr, quietly = TRUE)

n_aas <- 40

# 2: 30 secs
# 10: 150 sec = 3 mins
# 100: 1500 sec = 30 mins indeed
# 1000: 15000 sec = 300 mins = 5 hours predicted

n_peptides_per_hydrophobicity <- 2
if (peregrine::is_on_peregrine()) {
  n_peptides_per_hydrophobicity <- 1000
}

df <- tibble::as_tibble(
  expand.grid(
    idx = seq(1, n_peptides_per_hydrophobicity),
    min_hydrophobicity = seq(from = -4.5, to = 4.0, by = 0.5),
    sequence = NA,
    hydrophobicity = NA
  )
)
df$max_hydrophobicity <- df$min_hydrophobicity + 0.5

n_rows <- nrow(df)
for (i in seq_len(n_rows)) {
  sequence <- bbbq::create_random_peptide_with_hydrophobicity(
    n_aas = n_aas,
    min_hydrophobicity = df$min_hydrophobicity[i],
    max_hydrophobicity = df$max_hydrophobicity[i],
    n_attempts = 100000
  )
  df$sequence[i] <- sequence
  df$hydrophobicity[i] <- Peptides::hydrophobicity(sequence)
}

df <- df %>%
  select(-min_hydrophobicity) %>%
  select(-max_hydrophobicity) %>%
  select(-idx)

readr::write_csv(df, "peptides.csv")
