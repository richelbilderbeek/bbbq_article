# Create result.jsobn
if (!file.exists("result.json")) {
  system2("./download_json.sh")
}

# Read JSON
testthat::expect_true(file.exists("result.json"))
json <- jsonlite::read_json("result.json", simplifyVector = TRUE)

# Simplify, must be MHC binding essays
# "linear_sequence"      "mhc_allele_evidences" "mhc_allele_names"
library(purrr)
t <- dplyr::select(json, linear_sequence, mhc_allele_evidences, mhc_allele_names)
t <- t[
  purrr::map_lgl(t$mhc_allele_evidences, function(x) { "MHC binding assay" %in% x } ), 
]

# Simplify, have 1 MHC allele per row
# "linear_sequence", "mhc_allele_name"
tibbles <- list()
for (i in seq_len(nrow(t))) {
  tibbles[[i]] <- tibble::tibble(
    linear_sequence = t$linear_sequence[i],
    mhc_allele_name = t$mhc_allele_names[[i]]
  )
}
t <- dplyr::bind_rows(tibbles)
u <- t[t$mhc_allele_name %in% bbbq::get_mhc_haplotypes(), ]
u <- dplyr::distinct(u)

#
# Count occurances
#
# HLA-A*01:01 HLA-A*02:01 HLA-A*03:01 HLA-A*24:02 HLA-A*26:01 HLA-B*07:02 HLA-B*08:01 HLA-B*15:01 
# 13         356          16          13           2          24           8          12 
# HLA-B*18:01 HLA-B*27:05 HLA-B*39:01 HLA-B*40:02 HLA-B*58:01 
# 2          14           1           2           8 
hist <- table(u$mhc_allele_name)

# Do these 471 epitopes come from TMHs yes/no?
nrow(u)
nrow(dplyr::distinct(u))
readr::write_csv(u, "epitopes_iedb.csv")

if (1 == 2) {
  remotes::install_github("hrbrmstr/curlconverter")
  httpbinrhcurl <- "curl -X 'GET' 'https://query-api.iedb.org/epitope_search?structure_type=eq.Linear+peptide&tcell_ids=not.is.null&mhc_allele_names=cs.%7BHLA-A%2A02%3A01%7D&host_organism_iris=cs.%7BNCBITaxon%3A9606%7D&source_organism_iris=cs.%7BNCBITaxon%3A9606%7D&disease_names=cs.%7Bhealthy%7D&order=structure_iri'"
  httpbinrhcurl <- "curl 'https://query-api.iedb.org/epitope_search?structure_type=eq.Linear+peptide&tcell_ids=not.is.null&mhc_allele_names=cs.%7BHLA-A%2A02%3A01%7D&host_organism_iris=cs.%7BNCBITaxon%3A9606%7D&source_organism_iris=cs.%7BNCBITaxon%3A9606%7D&disease_names=cs.%7Bhealthy%7D&order=structure_iri'"
  straight <- curlconverter::straighten(httpbinrhcurl)
  res <- curlconverter::make_req(straight)
  r <- res[[1]]()
  json <- jsonlite::toJSON(httr::content(res[[1]](), as="parsed"), auto_unbox = TRUE, pretty=TRUE)
  system2("curl -X 'GET' 'https://query-api.iedb.org/epitope_search?structure_type=eq.Linear+peptide&tcell_ids=not.is.null&mhc_allele_names=cs.%7BHLA-A%2A02%3A01%7D&host_organism_iris=cs.%7BNCBITaxon%3A9606%7D&source_organism_iris=cs.%7BNCBITaxon%3A9606%7D&disease_names=cs.%7Bhealthy%7D&order=structure_iri'")
  system2("curl -X 'GET' 'https://query-api.iedb.org/epitope_search?structure_type=eq.Linear+peptide&tcell_ids=not.is.null&mhc_allele_names=cs.%7BHLA-A%2A02%3A01%7D&host_organism_iris=cs.%7BNCBITaxon%3A9606%7D&source_organism_iris=cs.%7BNCBITaxon%3A9606%7D&disease_names=cs.%7Bhealthy%7D&order=structure_iri' > result.json")
}
