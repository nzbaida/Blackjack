rm(list = ls())
deck <- read.csv("deck.csv")
deck$value[deck$face == "king" | deck$face == "queen" | deck$face == "jack"] <- 10
deck$value[deck$face == "ace"] <- 11
