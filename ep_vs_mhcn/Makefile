all: ep_vs_mhcn.png ep_vs_mhcn.csv

ep_vs_mhcn.png: create_figure.R ic50s.csv
	sbatch ../../peregrine/scripts/run_r_script.sh create_figure.R
	# Rscript create_figure.R

ep_vs_mhcn.csv: create_table.R ic50s.csv
	sbatch ../../peregrine/scripts/run_r_script.sh create_table.R
	# Rscript create_table.R

ic50s.csv: create_dataset.R
	sbatch ../../peregrine/scripts/run_r_script.sh create_dataset.R
	# Rscript create_dataset.R

#ep_vs_mhcn.latex: ep_vs_mhcn.csv
	#sbatch ../../peregrine/scripts/csv2latex.sh ep_vs_mhcn.csv ep_vs_mhcn.latex
	#csv2latex ep_vs_mhcn.csv --nohead > ep_vs_mhcn.latex

clean:
	rm *.png *.latex *.csv *.pdf
