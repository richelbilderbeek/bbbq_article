library(markovchain)

# Let's assume all protein sequences are TMH
# Let's assume that a sequence is detected by MHC is 50%

transition_matrix <- matrix(c(0.5, 0.5, 0.5, 0.5), nrow = 2, byrow = TRUE)
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


draw_markov_chain <- function() {
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

  dot -Tpng markov_chain.dot > markov_chain.png
}
