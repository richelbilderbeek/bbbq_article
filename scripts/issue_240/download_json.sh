#!/bin/bash
curl -X 'GET' 'https://query-api.iedb.org/epitope_search?structure_type=eq.Linear+peptide&tcell_ids=not.is.null&mhc_allele_names=cs.%7BHLA-A%2A02%3A01%7D&host_organism_iris=cs.%7BNCBITaxon%3A9606%7D&source_organism_iris=cs.%7BNCBITaxon%3A9606%7D&disease_names=cs.%7Bhealthy%7D&order=structure_iri' > t_cell_HLA-A_02_01.json
curl -X 'GET' 'https://query-api.iedb.org/epitope_search?structure_type=eq.Linear+peptide&bcell_ids=not.is.null&mhc_allele_names=cs.%7BHLA-A%2A02%3A01%7D&host_organism_iris=cs.%7BNCBITaxon%3A9606%7D&source_organism_iris=cs.%7BNCBITaxon%3A9606%7D&disease_names=cs.%7Bhealthy%7D&order=structure_iri' > b_cell_HLA-A_02_01.json

require(httr)

# https://curl.trillworks.com/#r
#
#params = list(
#  `structure_type` = 'eq.Linear peptide',
#  `bcell_ids` = 'not.is.null',
#  `mhc_allele_names` = 'cs.{HLA-A*02:01}',
#  `host_organism_iris` = 'cs.{NCBITaxon:9606}',
#  `source_organism_iris` = 'cs.{NCBITaxon:9606}',
#  `disease_names` = 'cs.{healthy}',
#  `order` = 'structure_iri'
#)
#
#res <- httr::GET(url = 'https://query-api.iedb.org/epitope_search', query = params)
#
#NB. Original query string below. It seems impossible to parse and
#reproduce query strings 100% accurately so the one below is given
#in case the reproduced version is not "correct".
# res <- httr::GET(url = 'https://query-api.iedb.org/epitope_search?structure_type=eq.Linear+peptide&bcell_ids=not.is.null&mhc_allele_names=cs.%7BHLA-A%2A02%3A01%7D&host_organism_iris=cs.%7BNCBITaxon%3A9606%7D&source_organism_iris=cs.%7BNCBITaxon%3A9606%7D&disease_names=cs.%7Bhealthy%7D&order=structure_iri')

# HLA-A*01:01 -> mhc_allele_names=cs.%7BHLA-A%2A02%3A01%7D

# * -> 
#
#
# HLA-DPA1*01:03/DPB*01:01 -> mhc_allele_names=cs.%7BHLA-A%2A02%3A01%7D


