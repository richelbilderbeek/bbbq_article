# bbbq_article

Branch   |[GitHub Actions](https://github.com/richelbilderbeek/bbbq_article/actions)                                     
---------|--------------------------------------------------------------------------------------------------
`master` |![build_latex](https://github.com/richelbilderbeek/bbbq_article/actions/workflows/build_latex/badge.svg?branch=master)
`develop` |![build_latex](https://github.com/richelbilderbeek/bbbq_article/actions/workflows/build_latex/badge.svg?branch=develop)

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

Repository                                                                            |[GitHub Actions](https://github.com/informalr/informalr/actions)                                                         
--------------------------------------------------------------------------------------|-------------------------------------------------------------------------------------------------------------------------
[`bbbq`](https://github.com/richelbilderbeek/bbbq)                                    |![R-CMD-check](https://github.com/richelbilderbeek/bbbq/workflows/R-CMD-check/badge.svg?branch=master)                   
[`bbbq_1_smart`](https://github.com/richelbilderbeek/bbbq_1_smart)                      |![R-CMD-check](https://github.com/richelbilderbeek/bbbq_1_smart/workflows/R-CMD-check/badge.svg?branch=master)            
[`bbbq_article_issue_157`](https://github.com/richelbilderbeek/bbbq_article_issue_157)|![R-CMD-check](https://github.com/richelbilderbeek/bbbq_article_issue_157/workflows/R-CMD-check/badge.svg?branch=master) 
[`ncbi_peregrine`](https://github.com/richelbilderbeek/ncbi_peregrine)                |![R-CMD-check](https://github.com/richelbilderbeek/ncbi_peregrine/workflows/R-CMD-check/badge.svg?branch=master)         
[`ncbi_results`](https://github.com/richelbilderbeek/ncbi_results)                    |![R-CMD-check](https://github.com/richelbilderbeek/ncbi_results/workflows/R-CMD-check/badge.svg?branch=master)           

