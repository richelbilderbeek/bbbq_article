
if (1 == 2) {
  # epitopes useless for me
  library(epitopes)

  epitopes_folder <- rappdirs::app_dir(appname = "epitopes")$data()

  is_zip_downloaded <- function(epitopes_folder) {
    length(list.files(epitopes_folder, pattern = "\\.zip$")) == 1
  }

  is_zip_extracted <- function(epitopes_folder) {
    length(list.files(epitopes_folder, pattern = "\\.xml$")) > 20000
  }

  if (!is_zip_extracted(epitopes_folder = epitopes_folder)) {
    epitopes::get_IEDB(
      save_folder = epitopes_folder,
      remove_zip  = FALSE
    )
  }

  # Example code
  my.dir   <- system.file("extdata/xml_examples", package="epitopes")
  epitopes <- get_LBCE(my.dir)
  # > names(epitopes)
  # [1] "pubmed_id"      "year"           "epit_name"      "epitope_id"     "evid_code"
  # [6] "epit_struc_def" "sourceOrg_id"   "protein_id"     "epit_seq"       "start_pos"
  # [11] "end_pos"        "n_assays"       "host_id"        "bcell_id"       "assay_type"
  # [16] "n_Positive"     "n_Negative"     "assay_class"

  # Takes long
  t <- epitopes::get_LBCE(data_folder = epitopes_folder)
}
