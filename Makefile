all: view.sh article.pdf
	./view.sh

article.pdf: create.sh article.tex
	./create.sh

frans: bbbq.zip

bbbq.zip: zip.sh article.pdf
	./zip.sh
