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
  hydrophobicity_vs_is_tmh.png \
  is_tmh_vs_binds_mhc1.png \
  is_tmh_vs_binds_mhc2.png


all: $(figures_filenames)

data: p_bind_per_hydrophobicity.csv

$(figures_filenames): create_figures.R
	# Assumes 'p_bind_per_hydrophobicity.csv' is created
	Rscript create_figures.R

p_bind_per_hydrophobicity.csv: create_dataset.R peptides.csv
	Rscript create_dataset.R

peptides.csv: create_peptides.R
	Rscript create_peptides.R

clean:
	rm -f *.png *.pdf *.log *.png *.csv

