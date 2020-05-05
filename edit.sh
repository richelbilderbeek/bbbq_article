#!/bin/bash
#
# Start editing the article.
#
# Usage:
#
#   ./edit.sh
#

mousepad article.tex article.bib markov_chain.latex
make
