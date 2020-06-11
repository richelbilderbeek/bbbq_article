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

all: p_bind_per_hydrophobicity.png

p_bind_per_hydrophobicity.png: create_figures.R p_bind_per_hydrophobicity.csv
	Rscript create_figures.R

p_bind_per_hydrophobicity.csv: create_dataset.R peptides.csv
	Rscript create_dataset.R

peptides.csv: create_peptides.R
	Rscript create_peptides.R

clean:
	rm -f *.png *.pdf *.log *.png *.csv

