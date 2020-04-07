#!/bin/bash
#
# Convert article.tex to have 80 characters per line
#
# Usage:
#
#   ./to_80_chars.sh
#
fold -w 80 -s article.tex > article_new.tex
cp article_new.tex article.tex
rm article_new.tex
