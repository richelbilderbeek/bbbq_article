all: hydrophobicity.pdf

hydrophobicity.pdf: hydrophobicity.Rmd
	Rscript -e 'rmarkdown::render("hydrophobicity.Rmd")'

clean:
	rm *.png *.latex *.csv *.pdf
