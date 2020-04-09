all: article.pdf

article.pdf: article.tex
	./create.sh
	./view.sh

frans: article.tex
	./to_frans.sh
