# Get the distributions of IC50s for random peptides per haplotype
suppressMessages(library(ggplot2))
suppressMessages(library(dplyr))
suppressMessages(library(testthat))

df <- readr::read_csv("delta_ic50s_per_haplotype.csv")

#  geom_segment(aes(x = from_ic50, y = from_ic50, xend = from_ic50, yend = to_ic50)) +

n_peptides <- length(unique(df$from_peptide))
n_muts <- length(unique(df$to_peptide)) / n_peptides



df$haplotype <- as.factor(df$haplotype)
ggplot(df, aes(color = haplotype)) +
  geom_point(aes(x = from_ic50, y = to_ic50)) +
  geom_abline(slope = 1, intercept = 0, lty = "dashed") +
  xlab("IC50 before substitution") +
  ylab("IC50 after substitution") +
  labs(
    caption = glue::glue(
      "Peptides per haplotype: {n_peptides}. ",
      "Substitutions pers peptide: {n_muts}. ",
      "Dashed line: x = y."
    )
  ) + ggsave("delta_ic50s_per_haplotype.png", width = 7, height = 7)


expect_true(all(df$to_ic50 > 0.0))
expect_true(all(df$from_ic50 > 0.0))
df$ic50_changed <- df$to_ic50 / df$from_ic50

df$haplotype <- as.factor(df$haplotype)
ggplot(df, aes(x = haplotype, y = ic50_changed)) +
  geom_hline(yintercept = 1.0, lty = "dashed") +
  geom_boxplot() +
  xlab("Haplotype") +
  ylab("Relative IC50 after mutation (%)") +
  scale_y_log10(labels = scales::percent) +
  labs(
    caption = glue::glue(
      "Peptides per haplotype: {n_peptides}. ",
      "Substitutions pers peptide: {n_muts}. "
    )
  ) + ggsave("delta_ic50s_per_haplotype_perc.png", width = 7, height = 7)
