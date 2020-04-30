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
library(bbbq)
library(testthat)


focal_sequence <- "VVIILTIAGNILVIMAVSLE"
expect_true(bbbq::is_detected_by_mhc_1(focal_sequence))
expect_false(bbbq::is_detected_by_mhc_2(focal_sequence))

all_seqs <- get_adjacent_sequences(focal_sequence)
length(all_seqs) #380

all_tmhs <- all_seqs[ tmhmm::are_tmhs(all_seqs) ]
length(all_tmhs) #223

tmhs_detected_mhc_1 <- all_tmhs[ are_detected_by_mhc_1(all_tmhs) ]
length(tmhs_detected_mhc_1) #223

tmhs_detected_mhc_2 <- all_tmhs[ are_detected_by_mhc_2(all_tmhs) ]
length(tmhs_detected_mhc_2) #

n_both <- sum(tmhs_detected_mhc_2 %in% tmhs_detected_mhc_1) # 9
