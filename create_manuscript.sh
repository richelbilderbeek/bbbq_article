#!/bin/bash
#
# Create the PDF 'manuscript.pdf'
#
# It does so by converting the TeX to PDF, 
# as well as stitching some other PDFs to it
#
# Usage:
#
#   ./create_manuscript.sh
#
pdflatex manuscript.tex
bibtex manuscript >/dev/null
pdflatex manuscript.tex >/dev/null
pdflatex manuscript.tex

