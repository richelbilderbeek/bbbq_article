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

get_amino_acids <- function(
) {
  c("A", "C", "D", "E", "F", "G", "H", "I", "K", "L", "M", "N", "P", "Q", "R", "S", "T", "V", "W", "Y")
}
expect_equal(20, length(get_amino_acids()))

is_tmh <- function(protein_sequence) {
  locatome <- tmhmm::run_tmhmm_on_sequence(protein_sequence)
  stringr::str_count(string = locatome, pattern = "(M|m)") > 0
}
expect_true(is_tmh("VVIILTIAGNILVIMAVSLE"))

are_tmhs <- function(protein_sequences) {
  results <- rep(NA, length(protein_sequences))
  for (i in seq_along(protein_sequences)) {
    results[i] <- is_tmh(protein_sequences[i])
  }
  results
}
expect_true(are_tmhs("VVIILTIAGNILVIMAVSLE"))
expect_true(all(are_tmhs(c("VVIILTIAGNILVIMAVSLE", "VVIILTIAGNILVIMAVSLE"))))

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
    for (aa in get_amino_acids()) {
      seqs[i] <- replace_nth_char(s = aa_sequence, n = locus, c = aa)
      i <- i + 1
    }
  }
  seqs[ seqs != aa_sequence ]
}

is_detected_by_mhc_1 <- function(protein_sequence = "VVIIRTIAGRILVIMARSLE") {
  is_detected <- FALSE
  tryCatch({
    EpitopePrediction::binders(protein_sequence)
    is_detected <- TRUE
  },
    error = function(e) {}
  )
  is_detected
}
expect_true(is_detected_by_mhc_1("VVIILTIAGNILVIMAVSLE"))
expect_false(is_detected_by_mhc_1("VVIIRTIAGRILVIMARSLE"))

are_detected_by_mhc_1 <- function(protein_sequences) {
  are_detected <- rep(NA, length(protein_sequences))
  for (i in seq_along(protein_sequences)) {
    are_detected[i] <- is_detected_by_mhc_1(protein_sequences[i])
  }
  are_detected
}
expect_true(are_detected_by_mhc_1("VVIILTIAGNILVIMAVSLE"))
expect_false(are_detected_by_mhc_1("VVIIRTIAGRILVIMARSLE"))

is_detected_by_mhc_2 <- function(protein_sequence = "VVIIRTIAGRILVIMARSLE") {
  fasta_text <- c(">protein_name", protein_sequence)
  fasta_filename <- tempfile()
  writeLines(text = fasta_text, con = fasta_filename)
  results <- netmhc2pan::run_netmhc2pan(fasta_filename = fasta_filename)
  sum(results$Rank < 5.0) > 0
}
expect_true(is_detected_by_mhc_2("VVIIRTIAGRILVIMARSLE"))
expect_false(is_detected_by_mhc_2(protein_sequence = "VRRIRRIAGRIHVIRARSHE"))

are_detected_by_mhc_2 <- function(protein_sequences) {
  are_detected <- rep(NA, length(protein_sequences))
  for (i in seq_along(protein_sequences)) {
    are_detected[i] <- is_detected_by_mhc_2(protein_sequences[i])
  }
  are_detected
}
expect_true(are_detected_by_mhc_2("VVIIRTIAGRILVIMARSLE"))
expect_false(are_detected_by_mhc_2("VRRIRRIAGRIHVIRARSHE"))

focal_sequence <- "VVIILTIAGNILVIMAVSLE"
expect_true(is_detected_by_mhc_1(focal_sequence))
expect_false(is_detected_by_mhc_2(focal_sequence))

all_seqs <- get_adjacent_sequence(focal_sequence)
length(all_seqs) #380

all_tmhs <- all_seqs[ are_tmhs(all_seqs) ]
length(all_tmhs) #223

tmhs_detected_mhc_1 <- all_tmhs[ are_detected_by_mhc_1(all_tmhs) ]
length(tmhs_detected_mhc_1) #223

tmhs_detected_mhc_2 <- all_tmhs[ are_detected_by_mhc_2(all_tmhs) ]
length(tmhs_detected_mhc_2) #

n_both <- sum(tmhs_detected_mhc_2 %in% tmhs_detected_mhc_1) # 9
