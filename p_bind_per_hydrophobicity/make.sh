#!/bin/bash
# Bash script to run make with sbatch
#
# Usage:
#
#   sbatch make.sh
#
#SBATCH --time=240:00:00
#SBATCH --nodes=1
#SBATCH --ntasks-per-node=1
#SBATCH --ntasks=1
#SBATCH --mem=10G
#SBATCH --job-name=make_p_bind_per_hydrophobicity
#SBATCH --output=make_p_bind_per_hydrophobicity.log
module load R Python/3.8.2-GCCcore-9.3.0 binutils ImageMagick X11 libX11 xprop
make

