all: article.pdf

article.pdf: article.tex
	./create.sh
	./view.sh

