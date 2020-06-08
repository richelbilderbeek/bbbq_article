p_bind_per_hydrophobicity_filenames = \
  binds_mhc1_vs_binds_mhc2.png \
  hydrophobicity_vs_binds_mhc1.png \
  hydrophobicity_vs_binds_mhc2.png \
  hydrophobicity_vs_is_tmh.png \
  is_tmh_vs_binds_mhc1.png \
  is_tmh_vs_binds_mhc2.png

all: $(p_bind_per_hydrophobicity_filenames) p_bind_per_hydrophobicity.R

$(p_bind_per_hydrophobicity_filenames): p_bind_per_hydrophobicity.R p_bind_per_hydrophobicity.csv
	../../peregrine/scripts/run_r_script_with_x.sh p_bind_per_hydrophobicity.R
	# Rscript p_bind_per_hydrophobicity.R

p_bind_per_hydrophobicity.csv: create_dataset.R peptides.csv
	Rscript create_dataset.R

peptides.csv: create_dataset.R
	Rscript create_peptides.R

clean:
	rm -f *.png *.pdf *.log

