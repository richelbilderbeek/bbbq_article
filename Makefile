all: view.sh article.pdf
	./view.sh

article.pdf: create.sh article.tex bbbq_1/bbbq_1_percentages.latex bbbq_1/bbbq_1_stats.latex bbbq_1/fig_bbbq_1_watermarked.png
	aspell -t -c article.tex
	cd bbbq_1; make; cd ..
	./create.sh

bbbq_1/bbbq_1.Rmd:
	git clone https://github.com/richelbilderbeek/bbbq_1

bbbq_1/bbbq_1_percentages.latex: bbbq_1/bbbq_1.Rmd
	cd bbbq_1; make; cd ..
 
bbbq_1/bbbq_1_stats.latex: bbbq_1/bbbq_1.Rmd
	cd bbbq_1; make; cd ..

bbbq_1/fig_bbbq_1_watermarked.png: bbbq_1/bbbq_1.Rmd
	cd bbbq_1; make; cd ..

frans: bbbq.zip

bbbq.zip: zip.sh article.pdf
	./zip.sh
