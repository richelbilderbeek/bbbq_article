all: view.sh article.pdf
	./view.sh

article.pdf: create.sh article.tex ks/fig_1_watermarked.png ks/table_1.latex
	./create.sh

ks/fig_1_watermarked.png: ks/render.sh ks/ks.Rmd
	cd ks; ./render.sh; cd ..

ks/fig_1.png: ks/render.sh ks/ks.Rmd
	cd ks; ./render.sh; cd ..

ks/table_1.latex: ks/table_1.csv
	csv2latex ks/table_1.csv --nohead > ks/table_1.latex

ks/table_1.csv: ks/render.sh ks/ks.Rmd
	cd ks; ./render.sh; cd ..

frans: bbbq.zip

bbbq.zip: zip.sh article.pdf
	./zip.sh
