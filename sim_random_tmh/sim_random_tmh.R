# How likely is it to simulate a random TMH?
library(tmhmm)
result <- tmhmm::run_tmhmm_on_sequence(
  "QEKNWSALLTAVVIILTIAGNILVIMAVSLEKKLQ"
)

result
