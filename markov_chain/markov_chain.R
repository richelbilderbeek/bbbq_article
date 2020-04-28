library(markovchain)

# Let's assume all protein sequences are TMH
# Let's assume that a sequence is detected by MHC is 50%

show_igraph <- function(transition_matrix = matrix(c(0.5, 0.5, 0.5, 0.5), nrow = 2)) {
  markov_chain <- new(
    "markovchain",
    states = c("Detected","Undetected"),
    transitionMatrix = transition_matrix
  )

  markov_chain_as_net <- markovchain:::.getNet(markov_chain)
  igraph::plot.igraph(
    markov_chain_as_net,
    vertex.color = "white",
    vertex.frame.color = "Black",
    vertex.label.color = "Black",
    vertex.size = 70,
    edge.label = round(igraph::E(markov_chain_as_net)$weight / 100, 2),
    edge.color = "Black",
    edge.label.color = "Black",
    edge.arrow.size = 0.1,
    arrow.mode = 2,
    edge.curved = 0.5 * pi,
    layout = igraph::layout_on_grid
  )
}

show_dow <- function(
  transition_matrix = matrix(c(0.5, 0.5, 0.5, 0.5), nrow = 2)
) {
  dot_text <- c(
  "digraph markov_chain {",
  "  a [label=detected];",
  "  b [label=undetected];",
  "  a -> a [label=0.7 tailport=nw headport=sw];",
  "  a -> b [label=0.3 tailport=ne headport=nw];",
  "  b -> a [label=0.2 tailport=sw headport=se];",
  "  b -> b [label=0.8 tailport=se headport=ne];",
  "  { rank=same; a b }",
  "}"
  )
  dot_filename <- tempfile()
  writeLines(text = dot_text, con = dot_filename)
  png_filename <- tempfile()
  cmd <- paste0("dot -Tpng ", dot_filename, " > ", png_filename)
  system(cmd)
  grid::grid.raster(png::readPNG(png_filename))
}



show_tikz <- function(
  transition_matrix = matrix(c(0.5, 0.5, 0.5, 0.5), nrow = 2),
  png_filename = tempfile()
) {
  tex_text <- c(
    "% Drawing a graph",
    "% Author: Stefan Kottwitz",
    "% https://www.packtpub.com/hardware-and-creative/latex-cookbook",
    "\\documentclass[border=10pt]{standalone}",
    "\\usepackage{tkz-graph}",
    "\\GraphInit[vstyle = Shade]",
    "\\tikzset{",
    "  LabelStyle/.style = { rectangle, rounded corners, draw,",
    "                        minimum width = 2em, fill = yellow!50,",
    "                        text = red, font = \\bfseries },",
    "  VertexStyle/.append style = { inner sep=5pt,",
    "                                font = \\Large\\bfseries},",
    "  EdgeStyle/.append style = {->, bend left} }",
    "\\thispagestyle{empty}",
    "\\begin{document}",
    "\\begin{tikzpicture}",
    "  \\SetGraphUnit{5}",
    "  \\Vertex{B}",
    "  \\WE(B){A}",
    "  \\EA(B){C}",
    "  \\Edge[label = 1](A)(B)",
    "  \\Edge[label = 2](B)(C)",
    "  \\Edge[label = 3](C)(B)",
    "  \\Edge[label = 4](B)(A)",
    "  \\Loop[dist = 4cm, dir = NO, label = 5](A.west)",
    "  \\Loop[dist = 4cm, dir = SO, label = 6](C.east)",
    "  \\tikzset{EdgeStyle/.append style = {bend left = 50}}",
    "  \\Edge[label = 7](A)(C)",
    "  \\Edge[label = 8](C)(A)",
    "\\end{tikzpicture}",
    "\\end{document}"
  )
  tex_filename <- tempfile()
  writeLines(text = tex_text, con = tex_filename)
  cmd <- paste0("pdflatex ", tex_filename)
  system(cmd)
  pdf_filename <- paste0(basename(tex_filename), ".pdf")
  file.exists(pdf_filename)
  png_filename_0 <- tempfile()
  cmd <- paste0("pdftoppm ", pdf_filename, " ", png_filename_0, " -png")
  system(cmd)

  png_filename_1 <- stringr::str_replace(
    string = png_filename_0,
    pattern = basename(png_filename_0),
    replacement = paste0(basename(png_filename_0), "-1.png")
  )
  file.exists(png_filename_1)

  # Cleanup
  file.rename(from = png_filename_1, to = png_filename)
  file.remove(pdf_filename)

  grid::grid.raster(png::readPNG(png_filename))
}


