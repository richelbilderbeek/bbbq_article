all: compare_proteomes.pdf

compare_proteomes.pdf: compare_proteomes.Rmd UP000464024.fasta proteome.fasta
	Rscript -e 'rmarkdown::render("compare_proteomes.Rmd")'

UP000464024.fasta:
	cp ../downloads/UP000464024.fasta .

proteome.fasta:
	cp ../downloads/proteome.fasta .

clean:
	rm *.png *.latex *.csv *.pdf *.fasta




