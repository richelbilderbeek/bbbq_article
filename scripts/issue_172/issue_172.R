# Determine the minimum and maximum epitope length for MHCnuggets
t <- tibble::tibble(
  peptide_length = seq(1, 20),
  is_supported = NA
)

for (i in seq_len(nrow(t))) {
  peptide_length <- t$peptide_length[i]
  peptide <- paste0(rep("F", times = peptide_length), collapse = "")
  t$is_supported[i] <- FALSE
  tryCatch({
    mhcnuggetsr::predict_ic50(
      mhcnuggets_options = mhcnuggetsr::create_mhcnuggets_options(
        mhc = mhcnuggetsr::get_trained_mhc_1_haplotypes()[1]
      ),
      peptides = peptide
    )
    t$is_supported[i] <- TRUE
  }, error = function(e) {} # nolint
  )
}
t
knitr::kable(t)
