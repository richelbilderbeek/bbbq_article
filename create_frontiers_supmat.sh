#!/bin/bash
#
# Create the PDF 'frontiers_supmat.pdf'
#
# It does so by converting the TeX to PDF, 
# as well as stitching some other PDFs to it
#
# Usage:
#
#   ./create_frontiers_supmat.sh
#
pdflatex frontiers_SupplementaryMaterial.tex
bibtex frontiers_SupplementaryMaterial >/dev/null
pdflatex frontiers_SupplementaryMaterial.tex >/dev/null
pdflatex frontiers_SupplementaryMaterial.tex

