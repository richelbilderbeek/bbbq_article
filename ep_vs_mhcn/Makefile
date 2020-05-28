all: ep_vs_mhcn.png ep_vs_mhcn.latex

ep_vs_mhcn.png: ep_vs_mhcn.R
	Rscript ep_vs_mhcn.R

ep_vs_mhcn.latex: ep_vs_mhcn.csv
	csv2latex ep_vs_mhcn.csv --nohead > ep_vs_mhcn.latex

clean:
	rm *.png *.latex *.csv *.pdf
