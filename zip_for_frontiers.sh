#!/bin/bash
#
# Create a zip files with exactly those files that Frontiers needs
#
# Usage:
#
#   ./zip_for_frontiers.sh
#

# Article without figures, but with legends

# Article supmat

# TIFF files 
Rscript create_numbered_figure_files.R

zip 
