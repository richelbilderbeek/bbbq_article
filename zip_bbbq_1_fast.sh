#!/bin/bash
#
# make this project on Peregrine, by loading the required modules first.
#
# Usage (in queue, preferred):
#
#   sbatch ./zip_bbbq_1_fast.sh
#
# Usage (local):
#
#   ./zip_bbbq_1_fast.sh
#
#
# Peregrine directives:
#SBATCH --partition=vulture
#SBATCH --time=9:59:00
#SBATCH --nodes=1
#SBATCH --ntasks-per-node=1
#SBATCH --ntasks=1
#SBATCH --mem=1G
#SBATCH --job-name=zip_bbbq_1_fast
#SBATCH --output=zip_bbbq_1_fast.log
zip -r bbbq_1_fast.zip bbbq_1_fast/

