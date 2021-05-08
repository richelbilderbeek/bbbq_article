all: covid_dataset_strength.pdf

covid_dataset_strength.pdf: covid_dataset_strength.Rmd UP000464024.fasta
	Rscript -e 'rmarkdown::render("covid_dataset_strength.Rmd")'

UP000464024.fasta:
	cp ../downloads/UP000464024.fasta .
	#wget --no-check-certificate --auth-no-challenge --output-document=UP000464024.fasta "https://www.uniprot.org/uniprot/?query=proteome:UP000464024&format=fasta"

clean:
	rm -f *.png *.latex *.csv *.pdf *.fasta




