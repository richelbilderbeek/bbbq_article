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

