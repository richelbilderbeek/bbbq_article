suppressMessages(library(ggplot2))
suppressMessages(library(dplyr))

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
    df$is_tmh[i] <- pureseqtmr::is_tmh(polypeptide)
    df$binds_mhc1[i] <- bbbq::is_detected_by_mhc_1(polypeptide)
    #df$binds_mhc2[i] <- bbbq::is_detected_by_mhc_2(polypeptide)
  }
  df
}

df_1 <- create_dataset(
  n = 1000,
  n_aas = 40,
  f = bbbq::create_random_extreme_polypeptide
)
df_2 <- create_dataset(
  n = 1000,
  n_aas = 40,
  f = bbbq::create_random_hydrophobic_polypeptide
)
df <- rbind(df_1, df_2)
write.csv(x = df, file = "p_bind_per_hydrophobicity.csv")
