library(bbbq)
library(ggplot2, quietly = TRUE)
library(dplyr, warn.conflicts = FALSE)
library(testthat, warn.conflicts = FALSE)

t <- tidyr::expand_grid(
  official_name = bbbq::get_mhc_haplotypes(),
  mhc_class = NA,
  peptide_length = NA,
  percentile = bbbq::get_ic50_percentile_binder(),
  ic50_prediction_tool = c("EpitopePrediction", "netmhc2pan", "mhcnuggetsr"),
  ic50 = NA
)


t$mhc_class[ t$official_name %in% bbbq::get_mhc1_haplotypes() ] <- "I"
t$mhc_class[ t$official_name %in% bbbq::get_mhc2_haplotypes() ] <- "II"
t$peptide_length[ t$official_name %in% bbbq::get_mhc1_haplotypes() ] <- bbbq::get_mhc1_peptide_length()
t$peptide_length[ t$official_name %in% bbbq::get_mhc2_haplotypes() ] <- bbbq::get_mhc2_peptide_length()

nrow(t)
t <- t[-which(t$ic50_prediction_tool == "EpitopePrediction" & t$mhc_class == "II"), ]
nrow(t)
t <- t[-which(t$ic50_prediction_tool == "netmhc2pan" & t$mhc_class == "I"), ]
nrow(t)

for (i in seq_len(nrow(t))) {

  t$ic50[i] <- bbbq::get_ic50_threshold(
    haplotype = t$official_name[i],
    peptide_length = t$peptide_length[i],
    percentile = t$percentile[i],
    ic50_prediction_tool = t$ic50_prediction_tool[i]
  )
}
t$peptide_length <- as.factor(t$peptide_length)
t$mhc_class <- as.factor(t$mhc_class)
t$ic50_prediction_tool <- as.factor(t$ic50_prediction_tool)
t
expect_true(all(t$percentile == t$percentile[1]))
percentile <- t$percentile[1]

ggplot(t, aes(x = official_name, y = ic50, fill = ic50_prediction_tool)) +
  geom_col(position = "dodge") +
  theme(axis.text.x = element_text(angle = 90, hjust = 1)) +
  scale_y_log10(name = "IC50 (nM) threshold to be a binder") +
  scale_x_discrete(name = "Haplotype") +
  labs(
    caption = glue::glue(
      "Percentile: {percentile}"
    )
  ) +
  ggsave("ic50s_per_haplotype.png", width = 7, height = 7)



readr::write_csv(
  x = t %>%
  select(official_name, ic50_prediction_tool, ic50) %>%
  rename(haplotype = official_name),
  "ic50s_per_haplotype.csv"
)
