# What is the probability that a state transition takes place?
#
# States:
#  * Undetected
#  * Detected by MHC-I
#  * Detected by MHC-II
#  * Detected by both
#
# For example, if we start from a TMH that is undetected,
# what the chance it will be detected after an AA change?
#
# Algorithm:
#
# * Start from a TMH AA sequence
# * Measure the state from this sequence
# * Create all AA sequences that differ in one AA
# * Keep the ones that result in a TMH
# * Of those, count which state these are
# * Convert these counts to probabilities
library(testthat)

#' @param s the string
#' @param n the index of the character
#' @param c the character to be placed at that index
replace_nth_char <- function(s, n, c) {
  letter <- c
  # 1: The first n-1 chars,
  # 2: The character to be replaces
  # 3: The rest
  lhs <- paste0('^([A-Z]{', n - 1, '})(.)([A-Z]+)?$')
  rhs <- paste0('\\1', letter, '\\3')
  gsub(lhs, rhs, s)
}
expect_equal("XBC", replace_nth_char("ABC", 1, "X"))
expect_equal("AXC", replace_nth_char("ABC", 2, "X"))
expect_equal("ABX", replace_nth_char("ABC", 3, "X"))

get_adjacent_sequence <- function(aa_sequence = "VVIILTIAGNILVIMAVSLE")
{
  seqs <- rep(NA, nchar(aa_sequence) * 20)
  i <- 1
  for (locus in seq(1, nchar(aa_sequence))) {
    for (aa in bbbq::get_amino_acids()) {
      seqs[i] <- replace_nth_char(s = aa_sequence, n = locus, c = aa)
      i <- i + 1
    }
  }
  seqs[ seqs != aa_sequence ]
}

focal_sequence <- "VVIILTIAGNILVIMAVSLE"
expect_true(bbbq::is_detected_by_mhc_1(focal_sequence))
expect_false(bbbq::is_detected_by_mhc_2(focal_sequence))

all_seqs <- get_adjacent_sequence(focal_sequence)
length(all_seqs) #380

all_tmhs <- all_seqs[ tmhmm::are_tmhs(all_seqs) ]
length(all_tmhs) #223

tmhs_detected_mhc_1 <- all_tmhs[ are_detected_by_mhc_1(all_tmhs) ]
length(tmhs_detected_mhc_1) #223

tmhs_detected_mhc_2 <- all_tmhs[ are_detected_by_mhc_2(all_tmhs) ]
length(tmhs_detected_mhc_2) #

n_both <- sum(tmhs_detected_mhc_2 %in% tmhs_detected_mhc_1) # 9
