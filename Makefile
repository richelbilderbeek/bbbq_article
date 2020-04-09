all: article.pdf
	./view.sh

article.pdf: article.tex
	./create.sh
