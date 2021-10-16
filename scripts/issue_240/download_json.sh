#!/bin/bash
curl -X 'GET' 'https://query-api.iedb.org/epitope_search?structure_type=eq.Linear+peptide&tcell_ids=not.is.null&mhc_allele_names=cs.%7BHLA-A%2A02%3A01%7D&host_organism_iris=cs.%7BNCBITaxon%3A9606%7D&source_organism_iris=cs.%7BNCBITaxon%3A9606%7D&disease_names=cs.%7Bhealthy%7D&order=structure_iri' > result.json

