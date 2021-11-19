filenames <- list.files("numbered_figure_files", pattern = "tiff", full.names = TRUE)
filenames
testthat::expect_equal(length(filenames), 12)

fig_1_filenames <- stringr::str_subset(filenames, pattern = "figure_1")
fig_1_output_filename <- file.path(dirname(fig_1_filenames[1]), "figure_1.tiff")

args <- c(
  "montage",
  "-density", "300x300", 
  "-units", "PixelsPerInch",
  "-size", "3072x2048",
  fig_1_filenames, fig_1_output_filename
)
system2(command = args[1], args = args[-1])

