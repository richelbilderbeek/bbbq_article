
# For example, 'bbbq_1' for 'https://github.com/richelbilderbeek/bbbq_1'
repo_names = \
  bbbq_1 \
  bbbq_2

# For example, 'bbbq_1/Makefile'
makefile_names = $(foreach repo_name,$(repo_names),$(repo_name)/Makefile)

all_figure_filenames = \
  mhc2_haplotypes.latex \
  bbbq_1/bbbq_1_stats.latex \
  bbbq_1/bbbq_1_percentages.latex \
  bbbq_2/bbbq_2_stats.latex \
  bbbq_2/bbbq_2_percentages.latex

all_table_filenames = \
  bbbq_1/fig_bbbq_1_watermarked.png \
  bbbq_2/fig_bbbq_2_watermarked.png \
  pics/covid_genome_and_proteome.png \
  fig_tmh_mut_rate.png

all: view.sh article.pdf
	./view.sh

article.pdf: create.sh article.tex $(all_figure_filenames) $(all_table_filenames) $(makefile_names)
	aspell -t -c article.tex
	cd bbbq_1 && $(MAKE)
	cd bbbq_2 && $(MAKE)
	./create.sh

$(repo_names):
	git clone -b develop https://github.com/richelbilderbeek/$@.git

$(makefile_names): $(repo_names)
	cd $(dir $@) && $(MAKE)

bbbq_1/bbbq_1.Rmd: bbbq_1

bbbq_1/bbbq_1_percentages.latex: bbbq_1/bbbq_1.Rmd
	cd bbbq_1; make; cd ..
 
bbbq_1/bbbq_1_stats.latex: bbbq_1/bbbq_1.Rmd
	cd bbbq_1; make; cd ..

bbbq_1/fig_bbbq_1_watermarked.png: bbbq_1/bbbq_1.Rmd
	cd bbbq_1; make; cd ..

bbbq_2/bbbq_2.Rmd: bbbq_2

bbbq_2/bbbq_2_percentages.latex: bbbq_2/bbbq_2.Rmd
	cd bbbq_2; make; cd ..
 
bbbq_2/bbbq_2_stats.latex: bbbq_2/bbbq_2.Rmd
	cd bbbq_2; make; cd ..

bbbq_2/fig_bbbq_2_watermarked.png: bbbq_2/bbbq_2.Rmd
	cd bbbq_2; make; cd ..

mhc2_haplotypes.latex: mhc2_haplotypes.csv
	csv2latex mhc2_haplotypes.csv --nohead > mhc2_haplotypes.latex

pics/covid_genome_and_proteome.png: pics/covid_genome_and_proteome.gif
	convert pics/covid_genome_and_proteome.gif pics/covid_genome_and_proteome.png

frans: bbbq.zip

bbbq.zip: zip.sh article.pdf
	./zip.sh

clean:
	rm article.aux article.bbl article.blg article.docx article.log article.md article.odt article.out article.pdf article.rtf article.tex.bak article.txt *.zip

