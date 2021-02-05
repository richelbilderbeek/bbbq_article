selenoprotein_sequence <- "FAMILYVWU"
selenoprotein_sequence <- "UUUUUUUUU"

testthat::expect_error(
  EpitopePrediction::smm(selenoprotein_sequence),
  "subscript out of bounds"
)

testthat::expect_silent(
  mhcnuggetsr::predict_ic50(
    mhcnuggets_options = mhcnuggetsr::create_mhcnuggets_options(
      mhc = mhcnuggetsr::to_mhcnuggets_name(bbbq::get_mhc1_haplotypes()[1])
    ),
    peptides = selenoprotein_sequence
  )
)

testthat::expect_silent(
  netmhc2pan::predict_ic50(
    peptides = selenoprotein_sequence,
    mhc_haplotype = netmhc2pan::to_netmhc2pan_name(bbbq::get_mhc2_haplotypes()[1])
  )
)
