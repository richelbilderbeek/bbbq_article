# To run locally, just do:
#
#   make
#
# To run on Peregrine:
#
#   sbatch make_data.sh
#

all:
	echo "On Peregrine: 'sbatch make_data.sh'
	echo "On local: 'make figures'
	echo "Use 'make figures' for create the figures (do this locally)"
	echo" Use 'make data' to create the dataset (do this on Peregrine)"

figures: ep_vs_mhcn.png

data: ep_vs_mhcn.csv

ep_vs_mhcn.png: create_figure.R ic50s.csv
	Rscript create_figure.R

ep_vs_mhcn.csv: create_table.R ic50s.csv
	Rscript create_table.R

ic50s.csv: create_dataset.R
	Rscript create_dataset.R

clean:
	rm *.png *.latex *.csv *.pdf
