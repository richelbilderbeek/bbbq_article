#!/bin/bash
#
# Create a zip files with exactly those files that Frontiers needs
#
# Usage:
#
#   ./zip_frontiers_template.sh
#

zip frontiers_template.zip bbbq_article.bib frontiers_SupplementaryMaterial.tex frontiers.tex *.bst *.cls *.sty
