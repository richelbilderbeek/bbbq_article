# Calculate the relation between hydrophobicity
# and chance to bind to MHC-I.
#
# H0: there is no relation
# H1: higher hydrophobicity equals higher chance to bind
#
library(ggplot2)

#' Create a random polypeptide
#' @param n_aas number of amino acids
create_random_polypeptide <- function(n_aas)
{
  paste0(
    sample(x = bbbq::get_amino_acids(), size = n_aas, replace = TRUE),
    collapse = ""
  )
}

create_random_extreme_polypeptide <- function(n_aas)
{
  aas <- bbbq::get_amino_acids()
  hs <- Peptides::hydrophobicity(aas)
  prob <- abs(hs ^ 5)
  paste0(
    sample(
      x = aas, size = n_aas, replace = TRUE, prob = prob),
    collapse = ""
  )
}

create_random_tmh <- function(n_aas)
{
  seq <- create_random_hydrophobic_polypeptide(n_aas)
  while (!tmhmm::is_tmh(seq)) {
    seq <- create_random_hydrophobic_polypeptide(n_aas)
  }
  seq
}
create_random_tmh(20)

#' Create a dataset
#' @param n number of polypeptides
#' @param n_aas number of amino acids per polypeptide
#' @param f function to create a polypeptide
create_dataset <- function(
  n,
  n_aas,
  f
) {
  df <- tibble::tibble(
    hydrophobicity = rep(NA, n),
    is_tmh = NA,
    binds_mhc1 = NA,
    binds_mhc2 = NA
  )
  df$hydrophobicity <- as.numeric(df$hydrophobicity)
  df$is_tmh <- as.numeric(df$is_tmh)
  df$binds_mhc1 <- as.numeric(df$binds_mhc1)
  df$binds_mhc2 <- as.numeric(df$binds_mhc2)
  for (i in seq(1, n)) {
    polypeptide <- f(n_aas)
    df$hydrophobicity[i] <- Peptides::hydrophobicity(polypeptide)
    df$is_tmh[i] <- tmhmm::is_tmh(polypeptide)
    df$binds_mhc1[i] <- bbbq::is_detected_by_mhc_1(polypeptide)
    df$binds_mhc2[i] <- bbbq::is_detected_by_mhc_2(polypeptide)
  }
  df
}


save_plots <- function(
  df,
  filenames
) {

  ggplot(df, aes(x = hydrophobicity, y = binds_mhc1)) +
    geom_point(height = 0.1) +
    geom_smooth(method = "lm") +
    labs(
      caption = paste0(
        "R squared: ",
        round(
          summary(lm(binds_mhc1 ~ hydrophobicity, data = df))$r.squared,
          digits = 3
        )
      )
    ) + ggsave(filenames[1], width = 7, height = 7)

  ggplot(df, aes(x = hydrophobicity, y = binds_mhc2)) +
    geom_point() +
    geom_smooth(method = "lm") +
    labs(
      caption = paste0(
        "R squared: ",
        round(
          summary(lm(binds_mhc2 ~ hydrophobicity, data = df))$r.squared,
          digits = 3
        )
      )
    ) + ggsave(filenames[2], width = 7, height = 7)

  ggplot(df, aes(x = as.factor(binds_mhc1), y = hydrophobicity)) +
    geom_boxplot() + ggsave(filenames[3])

  ggplot(df, aes(x = as.factor(binds_mhc2), y = hydrophobicity)) +
    geom_boxplot() + ggsave(filenames[4])
}

save_plots(
  df = create_dataset(n = 1000, n_aas = 20, f = create_random_hydrophobic_polypeptide),
  filenames = c(
    "p_bind_mhc1_per_hydrophobicity.png",
    "p_bind_mhc2_per_hydrophobicity.png",
    "hydrophobicity_per_mhc1.png",
    "hydrophobicity_per_mhc2.png"
  )
)

save_plots(
  df = create_dataset(n = 1000, n_aas = 20, f = create_random_tmh),
  filenames = c(
    "p_bind_mhc1_per_hydrophobicity_tmh.png",
    "p_bind_mhc2_per_hydrophobicity_tmh.png",
    "hydrophobicity_per_mhc1_tmh.png",
    "hydrophobicity_per_mhc2_tmh.png"
  )
)
