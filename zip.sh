#!/bin/bash
pandoc article.tex -o article.docx
zip bbbq.zip article.pdf article.docx
