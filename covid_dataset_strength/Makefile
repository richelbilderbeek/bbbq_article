all: covid_dataset_strength.pdf

covid_dataset_strength.pdf: covid_dataset_strength.Rmd
	Rscript -e 'rmarkdown::render("covid_dataset_strength.Rmd")'

clean:
	rm *.png *.latex *.csv *.pdf
