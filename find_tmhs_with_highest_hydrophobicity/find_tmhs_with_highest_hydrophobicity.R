aas <- get_amino_acids()
hydrophobicities <- Peptides::hydrophobicity(aas)
df <- data.frame(aa = aas, hydropbobicity = hydrophobicities)
df
is_tmh("VVVVVVVVVVVVVVVVVVVV")
highest <- -10 # Highest hydrophobicity for a non-TMH
lowest <- 10 # Highest hydrophobicity for a TMH
highest_seq <- ""
lowest_seq <- ""
for (i in seq(1, 10000)) {
   seq <- bbbq::create_random_hydrophobic_polypeptide(20)
    h <- Peptides::hydrophobicity(seq)
   if (!is_tmh(seq)) {
     if (h > highest) {
       message("seq: ", seq, ", H: ", h)
       highest <- h
       highest_seq <- seq
     }
   } else {
     if (h < lowest) {
       message("seq: ", seq, ", H: ", h)
       lowest <- h
       lowest_seq <- seq
     }
   }
}

# Lowest hydrophobicity for TMH:
# seq: HVALAHYAGVAITILMGWAP, H: 1.21
# seq: NIHWYALGMIGATMWAAIFV, H: 1.2

# Highest hydrophobicity for non-TMH:
# seq: ILIFCCMILLVCIVCCLVVF, H: 3.5
# seq: VLIIICLIAVIIACLCCVCL, H: 3.545
# seq: LIIVVIIMIVCVVVACCLCI, H: 3.675
