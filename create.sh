#!/bin/bash
#
# Create the PDF 'bbbq_article.pdf'
#
# It does so by converting the TeX to PDF, 
# as well as stitching some other PDFs to it
#
# Usage:
#
#   ./create.sh
#
pdflatex bbbq_header.tex
bibtex bbbq_header >/dev/null
pdflatex bbbq_header.tex >/dev/null
pdflatex bbbq_header.tex
pdftk bbbq_header.pdf covid_dataset_strength/covid_dataset_strength.pdf \
  cat output bbbq_article.pdf
rm bbbq_header.pdf
