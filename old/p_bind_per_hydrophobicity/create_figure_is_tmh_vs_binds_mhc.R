# Calculate the relation between hydrophobicity
# and chance to bind to MHC-I.
#
# H0: there is no relation
# H1: higher hydrophobicity equals higher chance to bind
#
library(ggplot2, quietly = TRUE)
library(dplyr, quietly = TRUE)
library(testthat, quietly = TRUE)
library(bbbq, quietly = TRUE)

raw_data <- "dataset.csv"
expect_true(file.exists(raw_data))
df <- readr::read_csv(raw_data)

plot_is_tmh_vs_is_binder <- function(
  df,
  png_filename = tempfile(fileext = ".png")
) {
  mhc_class <- NA
  if (df$mhc_haplotype[1] %in% bbbq::get_mhc1_haplotypes()) {
    mhc_class <- "I"
    testthat::expect_true(
      all(df$mhc_haplotype %in% bbbq::get_mhc1_haplotypes())
    )
  }
  if (df$mhc_haplotype[1] %in% bbbq::get_mhc2_haplotypes()) {
    mhc_class <- "II"
    testthat::expect_true(
      all(df$mhc_haplotype %in% bbbq::get_mhc2_haplotypes())
    )
  }
  testthat::expect_true(!is.na(mhc_class))
  n_haplotypes <- length(unique(df$mhc_haplotype))
  n_peptides <- length(unique(df$sequence))


  df_tally <- df %>%
    dplyr::group_by(is_tmh, is_binder) %>%
    dplyr::tally()
  ggplot2::ggplot(df_tally, ggplot2::aes(is_tmh, is_binder, fill = n)); ggplot2::geom_tile(); ggplot2::geom_text(ggplot2::aes(label = n));   ggplot2::scale_fill_gradient(low = "white", high = "red");   ggplot2::scale_x_discrete();   ggplot2::scale_y_discrete();   ggplot2::xlab("Is TMH? Left = no, right = yes");   ggplot2::ylab(
        glue::glue("Binds to MHC-{mhc_class}? Down = no, up = yes")
      );   ggplot2::labs(
        caption = glue::glue(
          "#peptides: {n_peptides}, # haplotypes: {n_haplotypes}"
        )
      );   ggplot2::ggsave(png_filename, width = 7, height = 7)
}


df_1 <- df %>% filter(mhc_haplotype %in% get_mhc1_haplotypes())
df_2 <- df %>% filter(mhc_haplotype %in% get_mhc2_haplotypes())

plot_is_tmh_vs_is_binder(
  df = df_1,
  png_filename = "is_tmh_vs_binds_mhc1.png"
)
plot_is_tmh_vs_is_binder(
  df = df_2,
  png_filename = "is_tmh_vs_binds_mhc2.png"
)

if (1 == 2) {
  df$is_tmh <- as.double(df$is_tmh)
  ggplot(df, aes(is_tmh, fill = is_binder)
  ); geom_histogram(
      breaks = c(-0.5, 0.5, 1.5)
  ) + scale_x_continuous(breaks = c(0, 1))
}
