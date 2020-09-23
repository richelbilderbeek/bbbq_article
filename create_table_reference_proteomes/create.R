# Create a table with the reference proteomes
library(dplyr, warn.conflicts = FALSE)

t <- tibble::tibble(
  target = bbbq::get_target_names(),
  name = NA,
  uniprot_id = NA
)

for (i in seq_len(nrow(t))) {
 t$name[i] <- bbbq::get_target_english_name(t$target[i])
 t$uniprot_id[i] <- bbbq::get_uniprot_id(t$target[i])
}

readr::write_csv(t, "uniprot_ids.csv")

knitr::kable(
  t %>% dplyr::select(name, uniprot_id),
  "latex",
  caption = paste0(
    "Overview of reference proteomes and Uniprot IDs"
  ),
  label = "uniprot_ids"
) %>% cat(., file = "uniprot_ids.latex")
