#!/bin/bash
#
# From the PDF 'bbbq_article.pdf', create these new files:
#
# (1) 'bbbq_article_main.pdf', the paper,  
# (2) 'bbbq_article_figures.pdf', the figures of the main part,  
# (3) 'bbbq_article_supplementary_materials.pdf', the supplementary materials
#
# usage:
#
#   ./split_pdf.sh
#
pdftk bbbq_article.pdf cat 1-27 output bbbq_article_main.pdf
pdftk bbbq_article.pdf cat 29-32 output bbbq_article_figures.pdf
pdftk bbbq_article.pdf cat 33-55 output bbbq_article_supplementary_materials.pdf
