# Calculate the relation between hydrophobicity
# and chance to bind to MHC-I.
#
# H0: there is no relation
# H1: higher hydrophobicity equals higher chance to bind
#
library(ggplot2, quietly = TRUE)
library(dplyr, quietly = TRUE)
library(testthat, quietly = TRUE)

raw_data <- "is_tmh.csv"
expect_true(file.exists(raw_data))
df <- readr::read_csv(raw_data)

ggplot(df, aes(hydrophobicity, fill = is_tmh)) +
  geom_histogram(
    breaks = seq(-4.5, 4.5, by = 0.5)
  ) + scale_x_continuous(
    breaks = seq(-5, 5, by = 1),
    minor_breaks = seq(-4.5, 4.5, by = 0.5)
  ) + scale_y_continuous(); ggsave("hydrophobicity_vs_is_tmh.png", width = 7, height = 7)
