#!/bin/bash
#
# From the PDF 'manuscript.pdf', create these new files:
#
# (1) 'manuscript_main.pdf', the paper,  
# (2) 'manuscript_figures.pdf', the figures of the main part,  
# (3) 'manuscript_supplementary_materials.pdf', the supplementary materials
#
# usage:
#
#   ./split_pdf.sh
#
pdftk manuscript.pdf cat 1-29 68-71 output manuscript_main.pdf
pdftk manuscript.pdf cat 31-34 output manuscript_figures.pdf
pdftk manuscript.pdf cat 35-66 output manuscript_supplementary_materials.pdf
