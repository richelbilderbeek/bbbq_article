p_bind_per_hydrophobicity_filenames = \
  p_bind_per_hydrophobicity/binds_mhc1_vs_binds_mhc2.png \
  p_bind_per_hydrophobicity/hydrophobicity_vs_binds_mhc1.png \
  p_bind_per_hydrophobicity/hydrophobicity_vs_binds_mhc2.png \
  p_bind_per_hydrophobicity/hydrophobicity_vs_is_tmh.png \
  p_bind_per_hydrophobicity/is_tmh_vs_binds_mhc1.png \
  p_bind_per_hydrophobicity/is_tmh_vs_binds_mhc2.png

all: $(p_bind_per_hydrophobicity_filenames) p_bind_per_hydrophobicity.R

$(p_bind_per_hydrophobicity_filenames): p_bind_per_hydrophobicity.R
	Rscript p_bind_per_hydrophobicity.R

clean:
	rm -f *.png *.pdf

