# Calculate the relation between hydrophobicity
# and chance to bind to MHC-I.
#
# H0: there is no relation
# H1: higher hydrophobicity equals higher chance to bind
#
library(ggplot2)
library(dplyr)

if (1 == 2) {
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
    n_aas = 20,
    f = bbbq::create_random_extreme_polypeptide
  )
  df_2 <- create_dataset(
    n = 1000,
    n_aas = 20,
    f = bbbq::create_random_hydrophobic_polypeptide
  )
  df <- rbind(df_1, df_2)
  write.csv(x = df, file = "~/raw_data.csv")
}

raw_data <- system.file("extdata", "raw_data.csv", package = "bbbq")

plot_is_tmh_vs_binds_mhc1 <- function(
  df = read.csv(system.file("extdata", "raw_data.csv", package = "bbbq")),
  png_filename = tempfile(fileext = ".png")
) {
  df_tally <- df %>%
    dplyr::group_by(is_tmh, binds_mhc1) %>%
    dplyr::tally()
  ggplot2::ggplot(df_tally, ggplot2::aes(is_tmh, binds_mhc1, fill = n)) +
    ggplot2::geom_tile() +
    ggplot2::geom_text(ggplot2::aes(label = n)) +
      ggplot2::scale_fill_gradient(low = "white", high = "red") +
      ggplot2::scale_x_discrete() +
      ggplot2::scale_y_discrete() +
      ggplot2::xlab("Is TMH? Left = no, right = yes") +
      ggplot2::ylab("Binds to MHC-I? Down = no, up = yes") +
      ggplot2::ggsave(png_filename, width = 7, height = 7)
}

plot_is_tmh_vs_binds_mhc2 <- function(
  df = read.csv(system.file("extdata", "raw_data.csv", package = "bbbq")),
  png_filename = tempfile(fileext = ".png")
) {
  df_tally <- df %>%
    dplyr::group_by(is_tmh, binds_mhc2) %>%
    dplyr::tally()
  ggplot2::ggplot(df_tally, ggplot2::aes(is_tmh, binds_mhc2, fill = n)) +
    ggplot2::geom_tile() +
    ggplot2::geom_text(ggplot2::aes(label = n)) +
      ggplot2::scale_fill_gradient(low = "white", high = "red") +
      ggplot2::scale_x_discrete() +
      ggplot2::scale_y_discrete() +
      ggplot2::xlab("Is TMH? Left = no, right = yes") +
      ggplot2::ylab("Binds to MHC-II? Down = no, up = yes") +
      ggplot2::ggsave(png_filename, width = 7, height = 7)
}

plot_binds_mhc1_vs_binds_mhc2 <- function(
  df = read.csv(system.file("extdata", "raw_data.csv", package = "bbbq")),
  png_filename = tempfile(fileext = ".png")
) {
  df_tally <- df %>%
    dplyr::group_by(binds_mhc1, binds_mhc2) %>%
    dplyr::tally()
  ggplot2::ggplot(df_tally, ggplot2::aes(binds_mhc1, binds_mhc2, fill = n)) +
    ggplot2::geom_tile() +
    ggplot2::geom_text(ggplot2::aes(label = n)) +
      ggplot2::scale_fill_gradient(low = "white", high = "red") +
      ggplot2::scale_x_discrete() +
      ggplot2::scale_y_discrete() +
      ggplot2::xlab("Binds to MHC-I?? Left = no, right = yes") +
      ggplot2::ylab("Binds to MHC-II? Down = no, up = yes") +
      ggplot2::ggsave(png_filename, width = 7, height = 7)
}

plot_hydrophobicity_vs_is_tmh <- function(
  df = read.csv(system.file("extdata", "raw_data.csv", package = "bbbq")),
  png_filename = tempfile(fileext = ".png")
) {
  df <- tibble::as_tibble(df)

  df_tally <- df %>%
    dplyr::mutate(bin = trunc(hydrophobicity * 2)) %>%
    dplyr::group_by(bin, is_tmh) %>%
    dplyr::tally()
  ggplot2::ggplot(df_tally, ggplot2::aes(bin, is_tmh, fill = n)) +
    ggplot2::geom_tile() +
    ggplot2::geom_text(ggplot2::aes(label = n)) +
      ggplot2::scale_fill_gradient(low = "white", high = "red") +
      ggplot2::scale_y_discrete() +
      ggplot2::xlab("Hydrophobicity x2") +
      ggplot2::ylab("Is TMH? Down = no, up = yes") +
      ggplot2::ggsave(png_filename, width = 7, height = 7)
}

plot_hydrophobicity_vs_binds_mhc1 <- function(
  df = read.csv(system.file("extdata", "raw_data.csv", package = "bbbq")),
  png_filename = tempfile(fileext = ".png")
) {
  df <- tibble::as_tibble(df)
  df_tally <- df %>%
    dplyr::mutate(bin = trunc(hydrophobicity * 2)) %>%
    dplyr::group_by(bin, binds_mhc1) %>%
    dplyr::tally()
  ggplot2::ggplot(df_tally, ggplot2::aes(bin, binds_mhc1, fill = n)) +
    ggplot2::geom_tile() +
    ggplot2::geom_text(ggplot2::aes(label = n)) +
      ggplot2::scale_fill_gradient(low = "white", high = "red") +
      ggplot2::scale_y_discrete() +
      ggplot2::xlab("Hydrophobicity x2") +
      ggplot2::ylab("Binds to MHC-I? Down = no, up = yes") +
      ggplot2::ggsave(png_filename, width = 7, height = 7)
}

plot_hydrophobicity_vs_binds_mhc2 <- function(
  df = read.csv(system.file("extdata", "raw_data.csv", package = "bbbq")),
  png_filename = tempfile(fileext = ".png")
) {
  df <- tibble::as_tibble(df)

  df_tally <- df %>%
    dplyr::mutate(bin = trunc(hydrophobicity * 2)) %>%
    dplyr::group_by(bin, binds_mhc2) %>%
    dplyr::tally()
  ggplot2::ggplot(df_tally, ggplot2::aes(bin, binds_mhc2, fill = n)) +
    ggplot2::geom_tile() +
    ggplot2::geom_text(ggplot2::aes(label = n)) +
      ggplot2::scale_fill_gradient(low = "white", high = "red") +
      ggplot2::scale_y_discrete() +
      ggplot2::xlab("Hydrophobicity x2") +
      ggplot2::ylab("Binds to MHC-II? Down = no, up = yes") +
      ggplot2::ggsave(png_filename, width = 7, height = 7)
}


plot_is_tmh_vs_binds_mhc1(png_filename = "is_tmh_vs_binds_mhc1.png")
plot_is_tmh_vs_binds_mhc2(png_filename = "is_tmh_vs_binds_mhc2.png")
plot_binds_mhc1_vs_binds_mhc2(png_filename = "binds_mhc1_vs_binds_mhc2.png")
plot_hydrophobicity_vs_is_tmh(png_filename = "hydrophobicity_vs_is_tmh.png")
plot_hydrophobicity_vs_binds_mhc1(png_filename = "hydrophobicity_vs_binds_mhc1.png")
plot_hydrophobicity_vs_binds_mhc2(png_filename = "hydrophobicity_vs_binds_mhc2.png")

return()

df <- read.csv(system.file("extdata", "raw_data.csv", package = "bbbq"))
df <- tibble::as_tibble(df)

names(df)
df_plot <- dplyr::mutate(df, bin = trunc(hydrophobicity * 2))
df_plot <- dplyr::mutate(
  df_plot,
  state_all = (is_tmh * 4) + (binds_mhc1 * 2) + binds_mhc2
)
df_plot <- dplyr::mutate(
  df_plot,
  state_no_mhc2 = (is_tmh * 2) + binds_mhc1
)
df_plot <- dplyr::mutate(
  df_plot,
  state_no_mhc1 = (is_tmh * 2) + binds_mhc2
)

df_tally_all <- df_plot %>%
  dplyr::group_by(bin, state_all) %>%
  dplyr::tally()
df_tally_no_mhc1 <- df_plot %>%
  dplyr::group_by(bin, state_no_mhc1) %>%
  dplyr::tally()
df_tally_no_mhc2 <- df_plot %>%
  dplyr::group_by(bin, state_no_mhc2) %>%
  dplyr::tally()


# Heatmap
ggplot(df_tally_no_mhc1, aes(bin, state_no_mhc1, fill = n)) +
  geom_tile() +
  labs(
    caption = paste0(
      "0 = 00: No TMH, No MHC-II\n",
      "1 = 01: No TMH, Yes MHC-II\n",
      "2 = 10: Yes TMH, No MHC-II\n",
      "3 = 11: Yes TMH, Yes MHC-II\n"
    )
  )


ggplot(df_tally_no_mhc2, aes(bin, state_no_mhc2, fill = n)) +
  geom_tile() +
  labs(
    caption = paste0(
      "0 = 00: No TMH, No MHC-I\n",
      "1 = 01: No TMH, Yes MHC-I\n",
      "2 = 10: Yes TMH, No MHC-I\n",
      "3 = 11: Yes TMH, Yes MHC-I\n"
    )
  )

ggplot(df_tally_all, aes(bin, state_all, fill = n)) +
  geom_tile() +
  labs(
    caption = paste0(
        "State:\n",
        "000: No TMH, No MHC-I, no MHC-II\n",
        "001: No TMH, No MHC-I, yes MHC-II\n",
        "010: No TMH, Yes MHC-I, no MHC-II\n",
        "100: Yes TMH, No MHC-I, no MHC-II\n"
    )
  )



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

if (1 == 2) {
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
}
