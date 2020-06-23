all: ic50s_per_haplotype.png ic50s_per_haplotype.latex

ic50s_per_haplotype.png:
	Rscript ic50s_per_haplotype.R

ic50s_per_haplotype.csv:
	Rscript ic50s_per_haplotype.R

ic50s_per_haplotype.latex: ic50s_per_haplotype.csv
	csv2latex ic50s_per_haplotype.csv --nohead > ic50s_per_haplotype.latex

clean:
	rm -f *.png *.pdf
