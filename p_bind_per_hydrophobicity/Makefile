# Usage:
#
# * On local, creates figures:
#
#   make
#
# * On Peregrine, creates data:
#
#   make data
#
#   (do this by 'sbatch make.sh)
#
figures_filenames = \
  binds_mhc1_vs_binds_mhc2.png \
  hydrophobicity_vs_binds_mhc1.png \
  hydrophobicity_vs_binds_mhc2.png \
  is_tmh_vs_binds_mhc1.png \
  is_tmh_vs_binds_mhc2.png


all: $(figures_filenames) hydrophobicity_vs_is_tmh.png

$(figures_filenames): create_figures.R
	# Assumes 'dataset.csv' is created
	# Tip: run 'make data' to create it
	Rscript create_figures.R

hydrophobicity_vs_is_tmh.png: create_figure_hydrophobicity_vs_is_tmh.R
	Rscript create_figure_hydrophobicity_vs_is_tmh.R

##########################################
# Data, run on Peregrine
##########################################
data: dataset.csv

dataset.csv: create_dataset.R is_binder.csv is_tmh.csv
	Rscript create_dataset.R

is_binder.csv: create_is_binder.R peptides.csv
	Rscript create_is_binder.R

is_tmh.csv: create_is_tmh.R peptides.csv
	Rscript create_is_tmh.R

peptides.csv: create_peptides.R
	Rscript create_peptides.R

clean:
	rm -f *.png *.pdf *.log *.png *.csv

