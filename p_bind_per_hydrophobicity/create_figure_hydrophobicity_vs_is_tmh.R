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

df_tally <- df %>%
  mutate(bin = trunc(hydrophobicity * 2)) %>%
  group_by(bin, is_tmh) %>%
  tally()

ggplot(df_tally, aes(bin, is_tmh, fill = n)) +
  geom_tile() +
  geom_text(aes(label = n)) +
    scale_fill_gradient(low = "white", high = "red") +
    scale_y_discrete() +
    xlab("Hydrophobicity x2") +
    ylab("Is TMH? Down = no, up = yes") +
    ggsave("hydrophobicity_vs_is_tmh.png", width = 7, height = 7)
