library(bbbq)
library(ggplot2, quietly = TRUE)
library(testthat)

t <- tidyr::expand_grid(
  official_name = bbbq::get_mhc_haplotypes(),
  mhc_class = NA,
  mhcnuggets_name = NA,
  peptide_length = c(9, 10),
  filename = NA,
  n_peptides = NA,
  percentile = 0.02,
  ic50 = NA
)
for (i in seq_len(nrow(t))) {
  if (t$official_name[i] %in% bbbq::get_mhc1_haplotypes()) t$mhc_class[i] <- "I"
  if (t$official_name[i] %in% bbbq::get_mhc2_haplotypes()) t$mhc_class[i] <- "II"
}
for (i in seq_len(nrow(t))) {
  t$mhcnuggets_name[i] <- mhcnuggetsr::to_mhcnuggets_name(t$official_name[i])
}
expect_true(all(mhcnuggetsr::are_mhcnuggets_names(t$mhcnuggets_name)))
for (i in seq_len(nrow(t))) {
  t$filename[i] <- mhcnpreds::get_lut_filename(
    mhc_haplotype = t$mhcnuggets_name[i],
    n_aas = t$peptide_length[i]
  )
}
for (i in seq_len(nrow(t))) {
  t$n_peptides[i] <- nrow(readr::read_csv(t$filename[i])
  )
}
for (i in seq_len(nrow(t))) {
  t$ic50[i] <- mhcnpreds::get_ic50_threshold(
    mhc_haplotype = t$mhcnuggets_name[i],
    n_aas = t$peptide_length[i],
    percentile = t$percentile[i]
  )
}
t$peptide_length <- as.factor(t$peptide_length)
t$mhc_class <- as.factor(t$mhc_class)
t
expect_true(all(t$percentile == t$percentile[1]))
percentile <- t$percentile[1]

expect_true(all(t$n_peptides == t$n_peptides[1]))
n_peptides <- t$n_peptides[1]

ggplot(t, aes(x = official_name, y = ic50, color = peptide_length)) +
  geom_point() +
  theme(axis.text.x = element_text(angle = 90, hjust = 1)) +
  scale_y_continuous(name = "IC50") +
  scale_x_discrete(name = "Haplotype") +
  labs(
    caption = glue::glue("Percentile: {percentile}, # peptides per IC50: {n_peptides}")
  ) +
  ggsave("ic50s_per_haplotype.png", width = 7, height = 7)
