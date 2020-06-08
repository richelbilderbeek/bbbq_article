# To run locally, just do:
#
#   make
#
# To run on Peregrine:
#
#   sbatch make.sh
#

all: ep_vs_mhcn.png ep_vs_mhcn_log.png ep_vs_mhcn_wide.csv

ep_vs_mhcn.png: ep_vs_mhcn.csv
	../../peregrine/scripts/run_r_script_with_x.sh create_figures.R
	# Rscript create_figures.R

ep_vs_mhcn_log.png: ep_vs_mhcn.csv
	../../peregrine/scripts/run_r_script_with_x.sh create_figures.R
	# Rscript create_figures.R

ep_vs_mhcn_wide.csv: create_table.R ep_vs_mhcn.csv
	Rscript create_table.R

# Long form
ep_vs_mhcn.csv: create_dataset.R
	Rscript create_dataset.R

clean:
	rm -f *.png *.latex *.csv *.pdf *.log
