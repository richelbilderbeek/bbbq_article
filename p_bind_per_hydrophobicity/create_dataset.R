library(dplyr, quietly = TRUE)
library(testthat)
library(readr)

is_tmh_filename <- "is_tmh.csv"
expect_true(file.exists(is_tmh_filename))
is_binder_filename <- "is_binder.csv"
expect_true(file.exists(is_binder_filename))

is_tmh <- read_csv(
  is_tmh_filename,
   col_types = cols(
     sequence = col_character(),
     hydrophobicity = col_double(),
     is_tmh = col_logical()
   )
)
is_binder <- readr::read_csv(
  is_binder_filename,
   col_types = cols(
     sequence = col_character(),
     mhc_haplotype = col_character(),
     percentile = col_double(),
     is_binder = col_logical()
   )
)

t <- dplyr::full_join(is_tmh, is_binder)
readr::write_csv(t, "dataset.csv")
