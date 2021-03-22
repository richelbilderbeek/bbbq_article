#!/bin/bash
#
# make this project on Peregrine, by loading the required modules first.
#
# Usage (in queue, preferred):
#
#   sbatch ./zip_bbbq_1.sh
#
# Usage (local):
#
#   ./zip_bbbq_1.sh
#
#
# Peregrine directives:
#SBATCH --time=100:00:00
#SBATCH --nodes=1
#SBATCH --ntasks-per-node=1
#SBATCH --ntasks=1
#SBATCH --mem=1G
#SBATCH --job-name=zip_bbbq_1
#SBATCH --output=zip_bbbq_1.log
zip -r bbbq_1.zip bbbq_1/
