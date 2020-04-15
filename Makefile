all: view.sh article.pdf
	./view.sh

article.pdf: create.sh article.tex mhc2_haplotypes.latex bbbq_1/bbbq_1_percentages.latex bbbq_1/bbbq_1_stats.latex bbbq_1/fig_bbbq_1_watermarked.png bbbq_2/bbbq_2_percentages.latex bbbq_2/bbbq_2_stats.latex bbbq_2/fig_bbbq_2_watermarked.png
	aspell -t -c article.tex
	cd bbbq_1; make; cd ..
	cd bbbq_2; make; cd ..
	./create.sh

bbbq_1/bbbq_1.Rmd:
	git clone https://github.com/richelbilderbeek/bbbq_1

bbbq_1/bbbq_1_percentages.latex: bbbq_1/bbbq_1.Rmd
	cd bbbq_1; make; cd ..
 
bbbq_1/bbbq_1_stats.latex: bbbq_1/bbbq_1.Rmd
	cd bbbq_1; make; cd ..

bbbq_1/fig_bbbq_1_watermarked.png: bbbq_1/bbbq_1.Rmd
	cd bbbq_1; make; cd ..

bbbq_2/bbbq_2.Rmd:
	git clone https://github.com/richelbilderbeek/bbbq_2

bbbq_2/bbbq_2_percentages.latex: bbbq_2/bbbq_2.Rmd
	cd bbbq_2; make; cd ..
 
bbbq_2/bbbq_2_stats.latex: bbbq_2/bbbq_2.Rmd
	cd bbbq_2; make; cd ..

bbbq_2/fig_bbbq_2_watermarked.png: bbbq_2/bbbq_2.Rmd
	cd bbbq_2; make; cd ..

mhc2_haplotypes.latex: mhc2_haplotypes.csv
	csv2latex mhc2_haplotypes.csv --nohead > mhc2_haplotypes.latex

frans: bbbq.zip

bbbq.zip: zip.sh article.pdf
	./zip.sh

clean:
	rm article.aux article.bbl article.blg article.docx article.log article.md article.odt article.out article.pdf article.rtf article.tex.bak article.txt *.zip

