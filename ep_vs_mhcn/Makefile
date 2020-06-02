all: ep_vs_mhcn.png ep_vs_mhcn.latex

ep_vs_mhcn.png: create_figure.R ic50s.csv
	Rscript create_figure.R

ep_vs_mhcn.csv: create_table.R ic50s.csv
	Rscript create_table.R

ic50s.csv: create_dataset.R
	Rscript create_dataset.R

ep_vs_mhcn.latex: ep_vs_mhcn.csv
	csv2latex ep_vs_mhcn.csv --nohead > ep_vs_mhcn.latex

clean:
	rm *.png *.latex *.csv *.pdf
