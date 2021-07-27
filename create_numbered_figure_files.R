#

tex_lines <- readr::read_lines("bbbq_article.tex")
includegraphics_lines <- stringr::str_subset(tex_lines, "^  .*includegraphics")
png_filenames <- stringr::str_match(includegraphics_lines, "includegraphics.*\\{(.*)\\}")[, 2]
testthat::expect_true(all(file.exists(png_filenames)))
tiff_filenames <- stringr::str_replace(png_filenames, "png$", "tiff")

tiff_filenames[!file.exists(tiff_filenames)]
testthat::expect_true(all(file.exists(tiff_filenames)))

