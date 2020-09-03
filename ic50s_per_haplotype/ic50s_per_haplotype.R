library(bbbq)
library(ggplot2, warn.conflicts = FALSE, quietly = TRUE)
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

title <- "IC50 values that define a binder"


ic50_prediction_tool_colors <- c(
  EpitopePrediction = "#555555",
  mhcnuggetsr = "#AAAAAA",
  netmhc2pan = "#FFFFFF"
)


ggplot(t, aes(x = official_name, y = ic50, fill = ic50_prediction_tool)) +
  geom_col(position = "dodge", col = "black") +
  theme(axis.text.x = element_text(angle = 90, hjust = 1)) +
  scale_fill_manual(values = ic50_prediction_tool_colors) +
  scale_y_log10(name = "IC50 (nM) threshold to be a binder") +
  scale_x_discrete(name = "Haplotype") +
  labs(
    title = title,
    caption = glue::glue(
      "Percentile: {percentile}"
    )
  ) +
  ggsave("ic50s_per_haplotype.png", width = 7, height = 7)

  ggplot(t, aes(x = official_name, y = ic50, fill = ic50_prediction_tool)) +
  geom_col(position = "dodge", col = "black") +
  theme(axis.text.x = element_text(angle = 90, hjust = 1)) +
  scale_fill_manual(values = ic50_prediction_tool_colors) +
  ggplot2::facet_grid(. ~ mhc_class, scales = "free_x") +
  scale_y_log10(name = "IC50 (nM) threshold to be a binder") +
  scale_x_discrete(name = "Haplotype") +
  labs(
    title = title,
    caption = glue::glue(
      "Percentile: {percentile}"
    )
  ) +
  ggsave("ic50s_per_haplotype_per_mhc_class.png", width = 7, height = 7)



readr::write_csv(
  x = t %>%
  select(official_name, ic50_prediction_tool, ic50) %>%
  rename(haplotype = official_name),
  "ic50s_per_haplotype.csv"
)

t
t_wide <- tidyr::pivot_wider(
  data = t %>% dplyr::select(official_name, ic50_prediction_tool, ic50, mhc_class),
  names_from = ic50_prediction_tool,
  values_from = ic50
)
t_wide

knitr::kable(
  t_wide, "latex",
  caption = glue::glue(
    "{title}. Percentile: {percentile}"
  ),
  label = "ic50s_per_haplotype"
) %>% cat(., file = "ic50s_per_haplotype.latex")

knitr::kable(
  t_wide %>% dplyr::filter(mhc_class == "I") %>% dplyr::select(official_name, EpitopePrediction, mhcnuggetsr),
  "latex",
  caption = glue::glue(
    "{title}, for MHC-I haplotypes. ",
    "Peptide length: {bbbq::get_mhc1_peptide_length()}. ",
    "Percentile: {percentile}."
  ),
  label = "ic50s_per_haplotype_1"
) %>% cat(., file = "ic50s_per_haplotype_1.latex")

knitr::kable(
  t_wide %>% dplyr::filter(mhc_class == "II") %>% dplyr::select(official_name, netmhc2pan, mhcnuggetsr),
  "latex",
  caption = glue::glue(
    "{title}, for MHC-II haplotypes. ",
    "Peptide length: {bbbq::get_mhc2_peptide_length()}. ",
    "Percentile: {percentile}."
  ),
  label = "ic50s_per_haplotype_2"
) %>% cat(., file = "ic50s_per_haplotype_2.latex")
