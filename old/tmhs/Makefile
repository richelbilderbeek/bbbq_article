all: tmhs.png covid_tmhs.latex

tmhs.png: tmhs.R
	Rscript tmhs.R

covid_tmhs.latex: tmhs.R
	Rscript tmhs.R

clean:
	rm *.png *.latex *.csv *.pdf
