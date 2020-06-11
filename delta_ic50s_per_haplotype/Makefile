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

delta_ic50s_per_haplotype.png: create_figures.R delta_ic50s_per_haplotype.csv
	Rscript create_figures.R

delta_ic50s_per_haplotype.csv: create_dataset.R peptides.csv
	Rscript create_dataset.R

peptides.csv: create_peptides.R
	Rscript create_peptides.R

zip:
	zip delta_ic50s_per_haplotype.zip delta_ic50s_per_haplotype.csv delta_ic50s_per_haplotype.png

clean:
	rm -f *.png *.pdf *.log *.png *.csv *.zip

