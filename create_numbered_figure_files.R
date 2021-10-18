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


figures <- tibble::tibble(
  number = c(
    paste0(1, letters[1:3]),
    paste0(2, letters[1]),
    paste0(3, letters[1:3]),
    paste0(4, letters[1:4])
  ),
  filename = NA
)
HIERO

t <- tibble::tibble(
  from = tiff_filenames,
  to = NA
)


t$to[1:4] <- paste0("~/figure_", seq(1, 4), ".tiff")
t$to[5:nrow(t)] <- paste0("~/figure_s", seq(1, nrow(t) - 4), ".tiff")

for (i in seq_len(nrow(t))) {
  file.copy(t$from[i], t$to[i])
}
