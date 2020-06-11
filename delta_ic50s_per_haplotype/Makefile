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

all: delta_ic50s_per_haplotype.png

data: delta_ic50s_per_haplotype.csv

# Ignore delta_ic50s_per_haplotype.csv
delta_ic50s_per_haplotype.png: create_figures.R
	Rscript create_figures.R

delta_ic50s_per_haplotype.csv: create_dataset.R peptides.csv
	Rscript create_dataset.R

peptides.csv: create_peptides.R
	Rscript create_peptides.R

zip:
	zip delta_ic50s_per_haplotype.zip *.csv *.png .R *.log *.sh

clean:
	rm -f *.png *.pdf *.log *.png *.csv *.zip

