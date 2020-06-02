library(ggplot2)
library(testthat)

expect_true(file.exists("ic50s.csv"))
df <- readr::read_csv("ic50s.csv")

# tool | haplotype | IC50
# -----|-----------|------
# EpitopPrediction |
expect_true("haplotype" %in% names(df))
expect_true("ic50" %in% names(df))
expect_true("tool" %in% names(df))

# Reshape from tidy data to wide data
df_wide <- tidyr::pivot_wider(
  df,
  names_from = tool,
  values_from = ic50
)
df_wide
write.csv(df_wide, "ep_vs_mhcn.csv", row.names = FALSE)
