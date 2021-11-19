#!/bin/bash
#
# Create a zip files with exactly those files that Frontiers needs
#
# Usage:
#
#   ./zip_for_frontiers.sh
#

# Article split in main part, figures and submat
chmod +x split_pdf.sh
./split_pdf.sh

# Creates the numbered TIFF files in 'numbered_figure_files'
Rscript create_numbered_figure_files.R

zip ~/frontiers.zip \
  bbbq_article.bib \
  bbbq_article.tex \
  bbbq_header.bbl \
  bbbq_header.blg \
  bbbq_header.tex \
  mee.bst \
  unsrtnat.bst \
  bbbq_article_main.pdf \
  bbbq_article_figures.pdf \
  bbbq_article_supplementary_materials.pdf \
  numbered_figure_files/*.tiff

