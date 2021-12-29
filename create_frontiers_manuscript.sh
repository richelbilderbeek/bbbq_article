#!/bin/bash
#
# Create the PDF 'frontiers.pdf'
#
# It does so by converting the TeX to PDF, 
# as well as stitching some other PDFs to it
#
# Usage:
#
#   ./create_frontiers_manuscript.sh
#
pdflatex frontiers.tex
bibtex frontiers >/dev/null
pdflatex frontiers.tex >/dev/null
pdflatex frontiers.tex

