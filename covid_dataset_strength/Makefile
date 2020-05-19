all: covid_dataset_strength.pdf

covid_dataset_strength.pdf: covid_dataset_strength.Rmd UP000464024.fasta
	Rscript -e 'rmarkdown::render("covid_dataset_strength.Rmd")'

UP000464024.fasta:
	# wget https://www.uniprot.org/proteomes/UP000464024#
	# wget https://www.uniprot.org/proteomes/UP000464024.fasta
	#uniprot-proteome UP000464024.fasta
	#Rscript -e 'UniprotR::GetProteomeFasta("UP000464024")'
	#Rscript -e 'UniprotR::getUniProt("UP000464024")'
	#wget --no-check-certificate https://www.uniprot.org/uniprot/?query=proteome:UP000464024&format=fasta
	#wget --no-check-certificate -o my.fasta "https://www.uniprot.org/uniprot/?query=proteome:UP000464024&format=fasta"
	wget --no-check-certificate --auth-no-challenge --output-document=UP000464024.fasta "https://www.uniprot.org/uniprot/?query=proteome:UP000464024&format=fasta"

clean:
	rm *.png *.latex *.csv *.pdf *.fasta




