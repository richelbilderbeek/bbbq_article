# To run locally, just do:
#
#   make
#
# To run on Peregrine:
#
#   sbatch ../../peregrine/scripts/run_make.sh
#

all: ep_vs_mhcn.png ep_vs_mhcn.csv
	echo 4

ep_vs_mhcn.png: create_figure.R ic50s.csv
	echo 1
	Rscript create_figure.R

ep_vs_mhcn.csv: create_table.R ic50s.csv
	echo 2
	Rscript create_table.R

ic50s.csv: create_dataset.R
	echo 3
	Rscript create_dataset.R

clean:
	rm *.png *.latex *.csv *.pdf
