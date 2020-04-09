#!/bin/bash
Rscript -e 'rmarkdown::render("ks.Rmd")'
# composite -tile -dissolve 5% -gravity center watermark.jpeg fig_1.png fig_1_watermarked.png


