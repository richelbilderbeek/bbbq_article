p_bind_per_hydrophobicity_filenames = \
  binds_mhc1_vs_binds_mhc2.png \
  hydrophobicity_vs_binds_mhc1.png \
  hydrophobicity_vs_binds_mhc2.png \
  hydrophobicity_vs_is_tmh.png \
  is_tmh_vs_binds_mhc1.png \
  is_tmh_vs_binds_mhc2.png

all: $(p_bind_per_hydrophobicity_filenames) p_bind_per_hydrophobicity.R

$(p_bind_per_hydrophobicity_filenames): create_figures.R p_bind_per_hydrophobicity.csv
	Rscript -e 'rmarkdown::render("p_transition.Rmd")'
	# ../../peregrine/scripts/run_r_script_with_x.sh create_figures.R
	# Rscript p_bind_per_hydrophobicity.R

p_bind_per_hydrophobicity.csv: create_dataset.R peptides.csv
	Rscript create_dataset.R

peptides.csv: create_peptides.R
	Rscript create_peptides.R

clean:
	rm -f *.png *.pdf *.log *.png *.csv

