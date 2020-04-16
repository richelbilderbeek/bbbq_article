all: tmhs.png

tmhs.png: tmhs.Rmd
	Rscript -e 'rmarkdown::render("tmhs.Rmd")'

clean:
	rm *.png *.latex *.csv *.pdf
