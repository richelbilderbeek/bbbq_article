#!/bin/bash

pdflatex article.tex --shell-escape >/dev/null
bibtex article.aux >/dev/null
pdflatex article.tex --shell-escape >/dev/null
pdflatex article.tex --shell-escape

