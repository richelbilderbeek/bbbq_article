# README

## FAQ

### How to create the picture?

```
dot -Tpng markov_chain.dot > markov_chain.png
```


library(markovchain)

# Let's assume all protein sequences are TMH
# Let's assume that a sequence is detected by MHC is 50%


draw_markov_chain <- function(png_filename = tempfile()) {
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
  writeLines(x = dot_text, con = dot_filename)
  system(
    "dot -O -Tpng markov_chain.dot > markov_chain.png"
  )

  
}

