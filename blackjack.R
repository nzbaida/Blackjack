rm(list = ls())
deck <- read.csv("deck.csv")
deck$value[deck$face == "king" | deck$face == "queen" | deck$face == "jack"] <- 10
deck$value[deck$face == "ace"] <- 11
deal <- function(){
  assign("deck", deck[-1,], parent.env(environment()))
  card <- deck[1,]
}
shuffle <- function(deck){
  Deck <- read.csv("deck.csv")
  random <- sample(1:52, size = 52)
  assign("deck", Deck[random,], parent.env(environment()))
}
