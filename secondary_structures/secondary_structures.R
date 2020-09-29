
# NO: Alpha helix, most common residues
testthat::expect_equal(0.02, Peptides::hydrophobicity("MALEK"), tol = 0.0001)

# helix-loop-helix
# From https://en.wikipedia.org/wiki/Basic_helix-loop-helix#Structure
# YES: Canonical
testthat::expect_equal(-0.6333, Peptides::hydrophobicity("CANNTG"), tol = 0.0001)
# NO: Consensus
testthat::expect_equal(0.8833, Peptides::hydrophobicity("CACGTG"), tol = 0.0001)


# Beta hairpin, https://en.wikipedia.org/wiki/Beta_hairpin
# YES: high in W
testthat::expect_equal(-0.9, Peptides::hydrophobicity("W"), tol = 0.0001)
