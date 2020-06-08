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
	echo "On local: 'make figures'"
	echo "Use 'make figures' to create the figure (do this locally)"
	echo" Use 'make data' to create the dataset (do this on Peregrine)"

figures:
	echo "Assumes 'ic50s.csv' is present, as created by Peregrine"
	Rscript create_figures.R

data: ep_vs_mhcn.csv ic50s.csv 

# Wide form
ep_vs_mhcn.csv: create_table.R ic50s.csv
	Rscript create_table.R

# Long form
ic50s.csv: create_dataset.R
	Rscript create_dataset.R

clean:
	rm -f *.png *.latex *.csv *.pdf
