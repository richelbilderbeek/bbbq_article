library(dplyr, warn.conflicts = FALSE)
library(ggplot2, warn.conflicts = FALSE)


counts_filenames <- "../bbbq_1_fast/counts.csv"
testthat::expect_true(file.exists(counts_filenames))

counts_per_protein <- readr::read_csv(counts_filenames)

counts <- counts_per_protein %>% dplyr::group_by(target, haplotype_id) %>%
  summarise(
    n_binders = sum(n_binders, na.rm = TRUE),
    n_binders_tmh = sum(n_binders_tmh, na.rm = TRUE),
    n_spots = sum(n_spots, na.rm = TRUE),
    n_spots_tmh = sum(n_spots_tmh, na.rm = TRUE),
    .groups = "drop"
  )

counts$f_tmh_binders <- counts$n_binders_tmh / counts$n_binders

haplotypes_lut <- bbbq::create_haplotypes_lut()

counts_with_haplotypes <- merge(counts, haplotypes_lut)

occurances <- rbind(
  bbbq::get_mhc1_haplotype_occurance(),
  bbbq::get_mhc2_haplotype_occurance()
)

t <- merge(counts_with_haplotypes, occurances)
t$phenotype_freq <- t$phenotype_freq/ 100.0
t$haplotype_perc <- t$haplotype_perc/ 100.0


ggplot2::ggplot(t, ggplot2::aes(x = phenotype_freq, y = f_tmh_binders, color = target)) +
  ggplot2::geom_point() +
  ggplot2::geom_smooth() +
  ggplot2::scale_y_continuous("Percentage binders that are TMH", labels = scales::percent) +
  ggplot2::scale_x_continuous("Haplotype phenotypic frequency", labels = scales::percent) +
  ggplot2::ggsave("phenotype_freq_vs_f_tmh_binders.png", width = 7, height = 7)

ggplot2::ggplot(t, ggplot2::aes(x = haplotype_perc, y = f_tmh_binders, color = target)) +
  ggplot2::geom_point() +
  ggplot2::geom_smooth() +
  ggplot2::scale_y_continuous("Percentage binders that are TMH", labels = scales::percent) +
  ggplot2::scale_x_continuous("Haplotype genotypic frequency", labels = scales::percent) +
  ggplot2::ggsave("haplotype_perc_vs_f_tmh_binders.png", width = 7, height = 7)
