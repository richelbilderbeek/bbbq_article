library(pureseqtmr, warn.conflicts = FALSE)
library(testthat, warn.conflicts = FALSE)
library(tidyr, warn.conflicts = FALSE)
library(ggplot2, warn.conflicts = FALSE)

expect_true(is_pureseqtm_installed())



fasta_filename <- "proteome.fasta"
expect_true(file.exists(fasta_filename))


topology <- pureseqtmr::predict_topology(fasta_filename)

n_tmh_aas <- sum(stringr::str_count(topology$topology, pattern = "1"))
n_non_tmh_aas <- sum(stringr::str_count(topology$topology, pattern = "0"))
f_tmh <- n_tmh_aas / (n_tmh_aas + n_non_tmh_aas)
text <-
readr::write_lines(
  x = glue::glue(
    "n_tmh_aas: {n_tmh_aas}\n",
    "n_non_tmh_aas: {n_non_tmh_aas}\n",
    "f_tmh: {f_tmh}\n"
  ),
  "f_tmh.txt"
)

# Create tally as CSV
tmhs_tally <- tally_tmhs(topology)
write.csv(tmhs_tally, "covid_tmhs.csv", row.names = FALSE)

# Create tally as LaTeX
knitr::kable(
  tmhs_tally, "latex",
  caption = paste0(
    "Number of TMHs per SARS-CoV-2 protein"
  ),
  label = paste0("covid_tmhs")
) %>% cat(., file = "covid_tmhs.latex")

# Create plot
plot_topology(topology) + ggsave("tmhs.png", width = 7, height = 7)


