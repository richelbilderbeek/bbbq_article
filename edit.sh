#!/bin/bash
#
# Start editing the article.
#
# Usage:
#
#   ./edit.sh
#

mousepad bbbq_header.tex bbbq_article.bib bbbq_article.tex
make
