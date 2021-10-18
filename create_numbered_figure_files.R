# Create the numbered figures as 'figure_1.tiff' etc,
# from the articles' better-described figure names
if (1 == 2) {
  setwd("~/GitHubs/bbbq_article")
}

tex_lines <- readr::read_lines("bbbq_article.tex")
includegraphics_lines <- stringr::str_subset(tex_lines, "^  .*includegraphics")
png_filenames <- stringr::str_match(includegraphics_lines, "includegraphics.*\\{(.*)\\}")[, 2]
testthat::expect_true(all(file.exists(png_filenames)))
tiff_filenames <- stringr::str_replace(png_filenames, "png$", "tiff")

tiff_filenames[!file.exists(tiff_filenames)]
testthat::expect_true(all(file.exists(tiff_filenames)))

figure_numbers <- c(
  paste0(1, letters[1:3]),
  "2",
  paste0(3, letters[1:3]),
  paste0(4, letters[1:4])
)
tiff_filenames <- tiff_filenames[1:length(figure_numbers)]
# figure_numbers <- c(figure_numbers, rep(NA, length(tiff_filenames) - length(figure_numbers)))
testthat::expect_equal(length(tiff_filenames), length(figure_numbers))

t <- tibble::tibble(
  figure_number = figure_numbers,
  tiff_filename = tiff_filenames,
  paper_filename = paste0("numbered_figure_files/figure_", figure_numbers, ".tiff")
)
t

for (i in seq_len(nrow(t))) {
  file.copy(
    from = t$tiff_filename[i], 
    to = t$paper_filename[i]
  )
}
