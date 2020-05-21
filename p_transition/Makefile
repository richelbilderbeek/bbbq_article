all: p_transition.pdf

p_transition.pdf: p_transition.Rmd
	Rscript -e 'rmarkdown::render("p_transition.Rmd")'

clean:
	rm -f *.png *.latex *.csv *.pdf *.fasta

