library(bbbq)

# By chance,
# Let's assume that a sequence is detected by MHC is 50%
transition_matrix <- matrix(rep(0.5, 4), nrow = 2)
bbbq::plot_markov_chain(transition_matrix)

# By chance,
# But if you are detected, you are probably hydrophobic.
# After a mutation, you probably still are.
# So self-loops are likelier.
transition_matrix[1,1] <- 0.9
transition_matrix[1,2] <- 0.1
transition_matrix[2,1] <- 0.1
transition_matrix[2,2] <- 0.9
bbbq::plot_markov_chain(transition_matrix)

# By chance,
# We assume it is easier to avoid detection (as there are so many ways)
# then it is to acquire being detected
transition_matrix[1,1] <- 0.8
transition_matrix[1,2] <- 0.2
transition_matrix[2,1] <- 0.1
transition_matrix[2,2] <- 0.9
bbbq::plot_markov_chain(transition_matrix)



transition_matrix <- matrix(
  c(
    0.5, 0.2, 0.2, 0.1,  # Undetected
    0.2, 0.5, 0.2, 0.1,  # Detected by I
    0.2, 0.2, 0.5, 0.1,   # Detected by II
    0.1, 0.2, 0.2, 0.5  # Detected by I and II
  ),
  nrow = 4, byrow = TRUE
)
png_filename <- tempfile()

markov_chain <- new(
  "markovchain",
  states = c("U", "D by I", "D by II", "D by both"),
  transitionMatrix = transition_matrix
)

markov_chain_as_net <- markovchain:::.getNet(markov_chain)
igraph::plot.igraph(
  markov_chain_as_net,
  edge.label = round(igraph::E(markov_chain_as_net)$weight / 100, 2)
)

#grDevices::png(png_filename)
igraph::plot.igraph(
  markov_chain_as_net,
  vertex.color = "white",
  vertex.frame.color = "Black",
  vertex.label.color = "Black",
  vertex.size = 70,
  edge.label = round(igraph::E(markov_chain_as_net)$weight / 100, 2),
  edge.color = "Black",
  edge.label.color = "Black",
  edge.arrow.size = 0.3,
  arrow.mode = 2,
  edge.curved = 0.125 * pi
  #layout = igraph::layout_on_grid
)
grDevices::dev.off()
