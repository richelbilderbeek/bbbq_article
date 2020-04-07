#!/bin/bash

pdflatex article.tex --shell-escape
bibtex article.aux
pdflatex article.tex --shell-escape
pdflatex article.tex --shell-escape

# pdfunite article.pdf ../figures/figures.pdf article_full.pdf
