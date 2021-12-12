# bbbq_article

Branch   |[![GitHub Actions logo](pics/GitHubActions.png)](https://github.com/richelbilderbeek/bbbq_article/actions)                                     
---------|--------------------------------------------------------------------------------------------------
`master` |[![Build LaTeX document](https://github.com/richelbilderbeek/bbbq_article/actions/workflows/build_latex.yaml/badge.svg?branch=master)](https://github.com/richelbilderbeek/bbbq_article/actions/workflows/build_latex.yaml)
`develop`|[![Build LaTeX document](https://github.com/richelbilderbeek/bbbq_article/actions/workflows/build_latex.yaml/badge.svg?branch=develop)](https://github.com/richelbilderbeek/bbbq_article/actions/workflows/build_latex.yaml)

The article 'Transmembrane helices are an overlooked and evolutionarily conserved source of major histocompatibility complex class I and II epitopes',
by Bilderbeek, Baranov, van den Bogaart and Bianchi.

 * [This article on biorxiv](https://www.biorxiv.org/content/10.1101/2021.05.02.441235v3)

```
Bilderbeek, Richèl JC, et al. "Transmembrane helices are an overlooked and evolutionarily conserved source of major histocompatibility complex class I and II epitopes." bioRxiv (2021).
```

```
@article{bilderbeek2021transmembrane,
  title={Transmembrane helices are an overlooked and evolutionarily conserved source of major histocompatibility complex class {I} and {II} epitopes},
  author={Bilderbeek, Richèl JC and Baranov, Maxim and van den Bogaart, Geert and Bianchi, Frans},
  journal={bioRxiv},
  year={2021},
  publisher={Cold Spring Harbor Laboratory}
}
```

## Build the article

```
make
```

## Zip the article for Frontiers

```
make frontiers
```

Will create a file `~/frontiers.zip` 
with all files for a Frontiers submission.

## Figure sources

See [numbered_figure_files.csv](numbered_figure_files.csv) where the 
numbered figures (`figure_1a.tiff`, etc) originally come from.

The subfigures (e.g. figure 1a, figure 1b), 
were put into TIFF figure files (e.g. figure 1, figure 2) by @fransbianchi.

The figure TIFF files (e.g. figure_1.tiff, figure_2.tiff) were converted
to EPS files (e.g. figure_1.eps, figure_2.eps)
using [https://www.freeconvert.com/tiff-to-eps](https://www.freeconvert.com/tiff-to-eps).

## Re-do the analysis

### Naturally presented epitopes are derived from TMH

See [https://github.com/richelbilderbeek/bbbq_article_issue_157](https://github.com/richelbilderbeek/bbbq_article_issue_157).

 * [ ] Zenodo here

### TMH-derived epitopes are over-presented

See [https://github.com/richelbilderbeek/bbbq_1_smart](https://github.com/richelbilderbeek/bbbq_1_smart).

 * [ ] Zenodo here

### TMHs are conserved

See [https://github.com/richelbilderbeek/ncbi_peregrine](https://github.com/richelbilderbeek/ncbi_peregrine) for the scripts.

 * [ ] Zenodo here

See [https://github.com/richelbilderbeek/ncbi_results](https://github.com/richelbilderbeek/ncbi_results) to see how the results are processed.

 * [ ] Zenodo here

## Dependencies

Repository                                                                            |[![GitHub Actions logo](pics/GitHubActions.png)](https://github.com/informalr/informalr/actions)                                                         
--------------------------------------------------------------------------------------|-------------------------------------------------------------------------------------------------------------------------
[`bbbq`](https://github.com/richelbilderbeek/bbbq)                                    |![R-CMD-check](https://github.com/richelbilderbeek/bbbq/workflows/R-CMD-check/badge.svg?branch=master)                   
[`bbbq_1_smart`](https://github.com/richelbilderbeek/bbbq_1_smart)                    |![make](https://github.com/richelbilderbeek/bbbq_1_smart/workflows/make/badge.svg?branch=master)            
[`bbbq_article_issue_157`](https://github.com/richelbilderbeek/bbbq_article_issue_157)|![R-CMD-check](https://github.com/richelbilderbeek/bbbq_article_issue_157/workflows/R-CMD-check/badge.svg?branch=master) 
[`ncbi_peregrine`](https://github.com/richelbilderbeek/ncbi_peregrine)                |![R-CMD-check](https://github.com/richelbilderbeek/ncbi_peregrine/workflows/R-CMD-check/badge.svg?branch=master)         
[`ncbi_results`](https://github.com/richelbilderbeek/ncbi_results)                    |![R-CMD-check](https://github.com/richelbilderbeek/ncbi_results/workflows/R-CMD-check/badge.svg?branch=master)           


# How did you make the comparison figure?

I made the comparison figure using:

```
compare bbbq_1_smart_results/fig_f_tmh_2_panel.png bbbq_1_smart_2aa_results/fig_f_tmh_2_panel.png compare_fig_f_tmh_2_panel.png
```

The comparison figure:

![](compare_fig_f_tmh_2_panel.png)

## Labels


\subsection{TMH epitopes obtained from experimental data}\label{subsec:elution_studies}
    \label{fig:bbbq_1_smart_results}
    \label{fig:hydrophobicity_1}
    \label{fig:hydrophobicity_2}
    \label{fig:2a}
    \label{fig:2b}
  \label{fig:elution}
    \label{fig:f_snps_found_and_expected}
    \label{fig:f_tmh_ncbi}
    \label{fig:conservation}
    \label{fig:f_snps_found_and_expected_per_spanner}
    \label{fig:conservation_per_spanner}
    \label{fig:f_tmh_ncbi_per_spanner}
    \label{fig:bianch_et_al_2017_1a}
    \label{fig:bilderbeek_et_al_2021_1a}
\label{subsec:ic50s_per_haplotype}
\label{subsec:counts}
  \label{fig:snp_rel_pos}
  \label{fig:thm_presentation_correlation}
  \label{fig:t_cells_present_tmh_derived_epitopes}
\label{subsec:prediction_software_used}
  \label{table:software_used}
  \label{fig:f_tmh_mhc1_normalized}
  \label{fig:f_tmh_mhc2_normalized}
  \label{fig:rel_presentation_per_haplotype}
  \label{fig:rel_presentation}
  \label{fig:snps_per_gene_name_ncbi}
  \label{fig:snps_per_gene_name_processed}
  \label{fig:n_proteins_per_gene_name}
  \label{fig:fig_n_snps_per_tmp}
  \label{fig:fig_n_tmhs_per_protein}
  \label{fig:bbbq_1_smart_results_2aas}



## Frontiers files

frontiers.aux
frontiersFPHY.cls
frontiersHLTH.cls
frontiersinHLTH&FPHY.bst
frontiersinSCNS_ENG_HUMS.bst
frontiers.log
frontiers.out
frontiers.pdf
frontiersSCNS.cls
frontiers_SupplementaryMaterial.tex
frontiers_suppmat.cls
frontiers.tex
logo1.eps
logo1-eps-converted-to.pdf
logo2.eps
logos.eps
logos-eps-converted-to.pdf
PDF examples
stfloats.sty
test.bib
YM-logo.eps

