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

#' Create a random hydrophobic polypeptide
#' @param n_aas number of amino acids
create_random_hydrophobic_polypeptide <- function(n_aas)
{
  aas <- bbbq::get_amino_acids()
  hs <- Peptides::hydrophobicity(aas)
  prob <- hs - min(hs)
  prob <- prob * prob
  paste0(
    sample(
      x = aas, size = n_aas, replace = TRUE, prob = prob),
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

n <- 1000
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
  polypeptide <- create_random_hydrophobic_polypeptide(n_aas = 15)
  df$hydrophobicity[i] <- Peptides::hydrophobicity(polypeptide)
  df$is_tmh[i] <- tmhmm::is_tmh(polypeptide)
  df$binds_mhc1[i] <- bbbq::is_detected_by_mhc_1(polypeptide)
  df$binds_mhc2[i] <- bbbq::is_detected_by_mhc_2(polypeptide)
}

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
  ) + ggsave("p_bind_mhc1_per_hydrophobicity.png", width = 7, height = 7)

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
  ) + ggsave("p_bind_mhc2_per_hydrophobicity.png", width = 7, height = 7)

ggplot(df, aes(x = as.factor(binds_mhc1), y = hydrophobicity, fill = as.factor(is_tmh))) +
  geom_boxplot() + ggsave("hydrophobicity_per_mhc1.png")

ggplot(df, aes(x = as.factor(binds_mhc2), y = hydrophobicity, fill = as.factor(is_tmh))) +
  geom_boxplot() + ggsave("hydrophobicity_per_mhc1.png")
