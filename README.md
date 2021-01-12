# bbbq_article

Branch   |[GitHub Actions](https://github.com/richelbilderbeek/bbbq_article/actions)                                     
---------|--------------------------------------------------------------------------------------------------
`master` |![R-CMD-check](https://github.com/richelbilderbeek/bbbq_article/workflows/R-CMD-check/badge.svg?branch=master) 
`develop`|![R-CMD-check](https://github.com/richelbilderbeek/bbbq_article/workflows/R-CMD-check/badge.svg?branch=develop)

## Dependencies

Repository                                                             |[GitHub Actions](https://github.com/informalr/informalr/actions)                                             |[![Codecov logo](man/figures/Codecov.png)](https://www.codecov.io)
-----------------------------------------------------------------------|-------------------------------------------------------------------------------------------------------------|-------------------------------------------------------------------------------------------------------------------------------------------------------
[`bbbq`](https://github.com/richelbilderbeek/bbbq)                     |![R-CMD-check](https://github.com/richelbilderbeek/bbbq/workflows/R-CMD-check/badge.svg?branch=master) |[![codecov.io](https://codecov.io/github/richelbilderbeek/bbbq/coverage.svg?branch=master)](https://codecov.io/github/richelbilderbeek/bbbq/branch/master)
[`bbbq_1_fast`](https://github.com/richelbilderbeek/bbbq_1_fast)       |![R-CMD-check](https://github.com/richelbilderbeek/bbbq_1_fast/workflows/R-CMD-check/badge.svg?branch=master) |[![codecov.io](https://codecov.io/github/richelbilderbeek/bbbq_1_fast/coverage.svg?branch=master)](https://codecov.io/github/richelbilderbeek/bbbq_1_fast/branch/master)
[`ncbi_peregrine`](https://github.com/richelbilderbeek/ncbi_peregrine) |![R-CMD-check](https://github.com/richelbilderbeek/ncbi_peregrine/workflows/R-CMD-check/badge.svg?branch=master) |[![codecov.io](https://codecov.io/github/richelbilderbeek/ncbi_peregrine/coverage.svg?branch=master)](https://codecov.io/github/richelbilderbeek/ncbi_peregrine/branch/master)

The Bianchi  Bilderbeek Bogaart Question answered.

## Run

```
make
```

## Schedule

Start     |End       |What                   
----------|----------|----------------------------------------------------------------------
2021-01-12|2021-01-??|Replicate `bbbq_1_fast` in /data/p230198/GitHubs/bbbq_1_fast, `sbatch peregrine_make.sh peregrine`, 16915938, 16919234
2021-01-12|2021-01-??|Replicate `bbbq_1_fast` with 2% in /data/p230198/GitHubs/bbbq_1_fast_2_perc, `sbatch peregrine_make.sh peregrine_make.sh`, 16919801



## Notes

 * [natural-selection-analysis-of-sars-cov-2-covid-19](https://observablehq.com/@spond/natural-selection-analysis-of-sars-cov-2-covid-19)
 * [Natural selection in the evolution of SARS-CoV-2 in bats, not humans, created a highly capable human pathogen](https://www.biorxiv.org/content/10.1101/2020.05.28.122366v2.full)
 * [Proteins structures of SARS-CoV-2](https://compsysbio.ornl.gov/covid-19/covid-19-structome/)

## Download 

 * [v0.7](http://richelbilderbeek.nl/bbbq_article_0_7.zip) (last Open Science approach)
