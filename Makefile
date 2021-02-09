# For example, 'bbbq_1' for 'https://github.com/richelbilderbeek/bbbq_1'
repo_names = \
  bbbq_1

# For example, 'bbbq_1/Makefile'
#makefile_names = $(foreach repo_name,$(repo_names),$(repo_name)/Makefile)


all_table_filenames = \
  mhc2_haplotypes.latex \
  ../bbbq_1_smart/table_tmh_binders_mhc1_2.latex \
  ../bbbq_1_smart/table_tmh_binders_mhc2_2.latex

all_figure_filenames = \
  ../bbbq_1_smart/fig_f_tmh_mhc1_2_grid.png \
  ../bbbq_1_smart/fig_f_tmh_mhc2_2_grid.png \
  pics/covid_genome_and_proteome.png \
  fig_tmh_mut_rate.png \
  tmhs/tmhs.png

# p_bind_per_hydrophobicity_filenames = \
#   p_bind_per_hydrophobicity/binds_mhc1_vs_binds_mhc2.png \
#   p_bind_per_hydrophobicity/hydrophobicity_vs_binds_mhc1.png \
#   p_bind_per_hydrophobicity/hydrophobicity_vs_binds_mhc2.png \
#   p_bind_per_hydrophobicity/hydrophobicity_vs_is_tmh.png \
#   p_bind_per_hydrophobicity/is_tmh_vs_binds_mhc1.png \
#   p_bind_per_hydrophobicity/is_tmh_vs_binds_mhc2.png


all: view.sh article.pdf
	./view.sh

article.pdf: create.sh \
             bbbq_article.tex $(all_figure_filenames) $(all_table_filenames) \
             $(p_bind_per_hydrophobicity_filenames) \
             covid_dataset_strength/covid_dataset_strength.pdf
	aspell -t -c bbbq_article.tex
	#cd bbbq_1 && $(MAKE)
	#cd bbbq_2 && $(MAKE)
	cd tmhs && $(MAKE)
	./create.sh

$(repo_names):
	cd .. ;  git clone https://github.com/richelbilderbeek/$@.git; cd bbbq_article

#$(makefile_names): $(repo_names)
#	cd $(dir $@) && $(MAKE)

# $(p_bind_per_hydrophobicity_filenames): p_bind_per_hydrophobicity/p_bind_per_hydrophobicity.csv p_bind_per_hydrophobicity/peptides.csv
# 	cd p_bind_per_hydrophobicity && $(MAKE)

tmhs/tmhs.png:
	cd tmhs && $(MAKE)

covid_dataset_strength/covid_dataset_strength.pdf:
	cd covid_dataset_strength && $(MAKE)

mhc2_haplotypes.latex: mhc2_haplotypes.csv
	csv2latex mhc2_haplotypes.csv --nohead > mhc2_haplotypes.latex

pics/covid_genome_and_proteome.png: pics/covid_genome_and_proteome.gif
	convert pics/covid_genome_and_proteome.gif pics/covid_genome_and_proteome.png

frans: bbbq.zip

bbbq.zip: zip.sh article.pdf
	./zip.sh

clean:
	rm bbbq_article.aux bbbq_article.bbl bbbq_article.blg bbbq_article.log bbbq_article.tex.bak
	rm bbbq_header.aux bbbq_header.bbl bbbq_header.blg bbbq_header.log bbbq_header.tex.bak
	rm article.docx article.md article.odt article.pdf article.rtf article.txt
	rm *.zip

