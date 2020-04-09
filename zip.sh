#!/bin/bash
pandoc article.tex -o article.odt
pandoc article.tex -o article.docx
pandoc article.tex -o article.md
pandoc article.tex -o article.txt
pandoc article.tex -o article.rtf
zip bbbq.zip article.pdf article.odt article.docx article.md article.txt article.rtf article.tex article.bib mee.bst
