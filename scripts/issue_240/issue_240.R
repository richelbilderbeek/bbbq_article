require(httr)

tibbles <- list()
i <- 1

for (haplotype in bbbq::get_mhc_haplotypes()) {
  # Use the IEDB names
  haplotype <- stringr::str_replace_all(
    haplotype, "\\*([[:digit:]]{2})([[:digit:]]{2})", 
    "*\\1:\\2"
  )
  haplotype
  for (which_cells in c("b_cells", "t_cells")) {
    message("haplotype:", haplotype, ", which_cells: ", which_cells)
    params <- list(
      `structure_type` = 'eq.Linear peptide',
      `mhc_allele_names` = paste0("cs.{", haplotype, "}"),
      `host_organism_iris` = 'cs.{NCBITaxon:9606}',
      `source_organism_iris` = 'cs.{NCBITaxon:9606}',
      `disease_names` = 'cs.{healthy}',
      `order` = 'structure_iri'
    )
    if (which_cells == "b_cells") {
      params$bcell_ids <- 'not.is.null'
    } else {
      testthat::expect_equal(which_cells, "t_cells")
      params$tcell_ids <- 'not.is.null'
    }
    res <- httr::GET(url = 'https://query-api.iedb.org/epitope_search', query = params)
    content <- httr::content(res)
    content
    linear_sequences <- purrr::map_chr(content, function(x) { x$linear_sequence } )
    are_mhc_binding_essays <- purrr::map_lgl(content, function(x) { "MHC binding assay" %in% x$mhc_allele_evidences } ) 
    testthat::expect_equal(length(linear_sequences), length(are_mhc_binding_essays))
    t <- tibble::tibble(linear_sequence = linear_sequences)
    t <- t[are_mhc_binding_essays, ]
    testthat::expect_equal(nrow(t), sum(are_mhc_binding_essays))
    t <- dplyr::distinct(t)
    t$haplotype <- haplotype 
    t$cell_type <- which_cells 
    message("Got ", nrow(t), " new epitopes")
    tibbles[[i]] <- t
    i <- i + 1
  }
}
tibbles
t <- dplyr::bind_rows(tibbles)
t
readr::write_csv(t, "~/issue_240.csv")



# Do these 471 epitopes come from TMHs yes/no?
nrow(u)
nrow(dplyr::distinct(u))
readr::write_csv(u, "epitopes_iedb.csv")


if (0 == 1) {
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
}

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


if (2 == 3) {
  # This one scales best
  require(httr)
  params = list(
    `structure_type` = 'eq.Linear peptide',
    `bcell_ids` = 'not.is.null',
    `mhc_allele_names` = 'cs.{HLA-A*02:01}',
    `host_organism_iris` = 'cs.{NCBITaxon:9606}',
    `source_organism_iris` = 'cs.{NCBITaxon:9606}',
    `disease_names` = 'cs.{healthy}',
    `order` = 'structure_iri'
  )
  res <- httr::GET(url = 'https://query-api.iedb.org/epitope_search', query = params)
  content <- httr::content(res)
  
  linear_sequences <- purrr::map_chr(content, function(x) { x$linear_sequence } )
  are_mhc_binding_essays <- purrr::map_lgl(content, function(x) { "MHC binding assay" %in% x$mhc_allele_evidences } ) 
  testthat::expect_equal(length(linear_sequences), length(are_mhc_binding_essays))
  t <- tibble::tibble(linear_sequence = linear_sequences)
  t <- t[are_mhc_binding_essays, ]
  testthat::expect_equal(nrow(t), sum(are_mhc_binding_essays))
  t <- dplyr::distinct(t)
  
  
  # Do these 471 epitopes come from TMHs yes/no?
  nrow(u)
  nrow(dplyr::distinct(u))
  readr::write_csv(u, "epitopes_iedb.csv")
}