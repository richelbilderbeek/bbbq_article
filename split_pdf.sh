#!/bin/bash
#
# From the PDF 'bbbq_article.pdf', create two new files:
#
# (1) 'bbbq_article_main.pdf', the paper,  
# (2) 'bbbq_article_supplementary_materials.pdf', the supplementary materials
#
# usage:
#
#   ./split_pdf.sh
#
pdftk bbbq_article.pdf cat 1-31 output bbbq_article_main.pdf
pdftk bbbq_article.pdf cat 32-54 output bbbq_article_supplementary_materials.pdf
