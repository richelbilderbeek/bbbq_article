#!/bin/bash

# The LaTeX files
#
#  * bbbq_1_fast/table_tmh_binders_mhc1.latex
#  * bbbq_1_fast/table_tmh_binders_mhc2.latex
#
# both are a table with more columns than fit on a page.
# 
# This script converts these to a format that fits on a page.
#
# The original format:
#
# ```
# \begin{table}
# \caption{\label{tab:tab:ic50_binders}IC50 values (in nM) per haplotype below which a peptide is considered a binder. Percentile used: 0.02}
# \centering
# \begin{tabular}[t]{l|r}
#   .. data
# \end{tabular}
# \end{table}
# ```

# A sidewaystable is not prettty
#
# %\begin{sidewaystable}
# %  \centering
# %  ... centered table here
# %\end{sidewaystable}
#
# sed -i 's/\\begin{table}/\\begin{sidewaystable}/' bbbq_1_fast/table_tmh_binders_mhc1.latex
# sed -i 's/\\end{table}/\\end{sidewaystable}/' bbbq_1_fast/table_tmh_binders_mhc1.latex
# sed -i 's/\\begin{table}/\\begin{sidewaystable}/' bbbq_1_fast/table_tmh_binders_mhc2.latex
# sed -i 's/\\end{table}/\\end{sidewaystable}/' bbbq_1_fast/table_tmh_binders_mhc2.latex



# 
# % \scalebox{0.7}{
# %  ... scaled table here
# % }

# Only tiny still does not fit
# 
# %{\tiny
# %  ... something with a tiny font
# %}
#
# sed -i 's/\\begin{table}/\\begin{table}{\\tiny/' bbbq_1_fast/table_tmh_binders_mhc1.latex
# sed -i 's/\\end{table}/}\\end{table}/' bbbq_1_fast/table_tmh_binders_mhc1.latex
# sed -i 's/\\begin{table}/\\begin{table}{\\tiny/' bbbq_1_fast/table_tmh_binders_mhc2.latex
# sed -i 's/\\end{table}/}\\end{table}/' bbbq_1_fast/table_tmh_binders_mhc2.latex


sed -i 's/\\begin{table}/\\begin{sidewaystable}{\\tiny/' bbbq_1_fast/table_tmh_binders_mhc1.latex
sed -i 's/\\end{table}/}\\end{sidewaystable}/' bbbq_1_fast/table_tmh_binders_mhc1.latex
sed -i 's/\\begin{table}/\\begin{sidewaystable}{\\tiny/' bbbq_1_fast/table_tmh_binders_mhc2.latex
sed -i 's/\\end{table}/}\\end{sidewaystable}/' bbbq_1_fast/table_tmh_binders_mhc2.latex

