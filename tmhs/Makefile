all: tmhs.png covid_tmhs.latex

tmhs.png: tmhs.Rmd
	Rscript -e 'rmarkdown::render("tmhs.Rmd")'

covid_tmhs.latex: covid_tmhs.csv
	csv2latex covid_tmhs.csv --nohead > covid_tmhs.latex

clean:
	rm *.png *.latex *.csv *.pdf
