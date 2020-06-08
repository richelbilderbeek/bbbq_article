# To run locally, just do:
#
#   make
#
# To run on Peregrine:
#
#   sbatch make_data.sh
#

all:
	echo "On Peregrine: 'sbatch make_data.sh'"
	echo "On local: 'make figure'"
	echo "Use 'make figure' to create the figure (do this locally)"
	echo" Use 'make data' to create the dataset (do this on Peregrine)"

figure: ep_vs_mhcn.png
	echo "Assumes 'ic50s.csv' is present, as created by Peregrine"
	Rscript create_figure.R

data: ep_vs_mhcn.csv

ep_vs_mhcn.csv: create_table.R ic50s.csv
	Rscript create_table.R

ic50s.csv: create_dataset.R
	Rscript create_dataset.R

clean:
	rm *.png *.latex *.csv *.pdf
