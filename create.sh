#!/bin/bash

pdflatex bbbq_header.tex
bibtex bbbq_header >/dev/null
pdflatex bbbq_header.tex >/dev/null
pdflatex bbbq_header.tex
mv bbbq_header.pdf bbbq_article.pdf

