if (1 == 2) {
  setwd("~/GitHubs/bbbq_article/scripts/issue_157")
  list.files()
}

filename <- "../../bbbq_article_issue_157/results.csv"
testthat::expect_true(file.exists(filename))
t <- readr::read_csv(filename)

t
# # A tibble: 4 × 6
# mhc_class tool          n n_tmp n_tmh  f_tmh
#     <dbl> <chr>     <dbl> <dbl> <dbl>  <dbl>
#         1 PureseqTM  7897   974   109 0.0138
#         1 TMHMM      7897   780   113 0.0143
#         2 PureseqTM 12712  5793   498 0.0392
#         2 TMHMM     12712  6023   504 0.0396

t$p_value <- NA
for (i in seq_len(nrow(t))) {
  t$p_value <- as.numeric(binom.test(x = t$n_tmh[i], n = t$n[i], p = 0.0)$p.value)
}
t

# mhc_class tool          n n_tmp n_tmh  f_tmh p_value
#     <dbl> <chr>     <dbl> <dbl> <dbl>  <dbl>   <dbl>
#         1 PureseqTM  7897   974   109 0.0138       0
#         1 TMHMM      7897   780   113 0.0143       0
#         2 PureseqTM 12712  5793   498 0.0392       0
#         2 TMHMM     12712  6023   504 0.0396       0
