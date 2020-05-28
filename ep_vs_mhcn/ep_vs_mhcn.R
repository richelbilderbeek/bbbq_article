library(ggplot2)
library(testthat)
library(bbbq)
library(EpitopePrediction)
library(mhcnuggetsr)

# MHC-I haplotypes used in this study
mhc1_haplotypes <- get_mhc1_haplotypes()

#mhc1_haplotypes_ep <- to_epitope_prediction_name(mhc1_haplotypes)
#mhc1_haplotypes_mhcn <- to_mhcnuggets_name(mhc1_haplotypes)
#expect_true(all(mhc1_haplotypes_mhcn %in% mhcnuggetsr::get_mhc_1_haplotypes()))
#expect_true(all(mhc1_haplotypes_ep %in% EpitopePrediction::supportedMHCs()$mhc))

n_aas <- 9

# A tidy tibble
df <- tibble::as_tibble(
  expand.grid(
    tool = c("ep", "mhcn"),
    haplotype = mhc1_haplotypes,
    sequence = bbbq::create_random_peptides(n_peptides = 100, n_aas = n_aas),
    ic50 = NA,
    stringsAsFactors = FALSE
  )
)

write.csv(df, "ic50s.csv")
df
n_rows <- nrow(df)
for (i in seq_len(n_rows)) {
  df$ic50[i] <- bbbq::predict_ic50s_mhc1(
    protein_sequence = df$sequence[i],
    mhc_1_haplotype = df$haplotype[i],
    n_aas = n_aas,
    tool = df$tool[i]
  )$ic50
}
df


# tool | haplotype | IC50
# -----|-----------|------
# EpitopPrediction |
expect_true("haplotype" %in% names(df))
expect_true("ic50" %in% names(df))
expect_true("tool" %in% names(df))

df_scatter <- tidyr::pivot_wider(
  df,
  names_from = tool,
  values_from = ic50
)

ggplot(df_scatter, aes(x = ep, y = mhcn, color = haplotype)) +
  geom_abline(slope = 1, intercept = 0, lty = "dashed") +
  geom_point() +
  scale_y_continuous(limits = c(0, max(df_scatter$mhcn))) +
  scale_x_continuous(limits = c(0, max(df_scatter$mhcn))) +
  geom_smooth(method = "lm", alpha = 0.1) +
  xlab("IC50 predicted by EpitopePrediction") +
  ylab("IC50 predicted by MHCnuggets") +
  labs(
    caption = paste0(
      "Dashed line: x = y. ",
      "Blue line = fit to linear model, should ideally match the dashed line"
    )
  ) + ggsave("ep_vs_mhcn.png", width = 7, height = 7)
