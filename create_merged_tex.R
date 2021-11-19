# Create one merged .tex file from the multiple one
#
# Output:
# * manuscript.tex
# * manuscript.bib
output_bib_filename <- "manuscript.bib"
output_tex_filename <- "manuscript.tex"

# Input
# * bbbq_header.tex
# * bbbq_article.tex
# * bbbq_article.bib
input_bib_filename <- "bbbq_article.bib"
input_header_tex_filename <- "bbbq_header.tex"
input_main_tex_filename <- "bbbq_article.tex"
testthat::expect_true(file.exists(input_bib_filename))
testthat::expect_true(file.exists(input_header_tex_filename))
testthat::expect_true(file.exists(input_main_tex_filename))

# Steps
#
# * 1. Copy .bib file
# * 2. Merge .tex files

file.copy(from = input_bib_filename, to = output_bib_filename, overwrite = TRUE)