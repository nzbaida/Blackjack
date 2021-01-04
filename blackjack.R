setup <- function(){
  rm(list = ls())
  setwd("C:/Users/natty/Desktop/R Practice")
  deck <- read.csv("deck.csv")
  deck$value[deck$face == "king" | deck$face == "queen" | deck$face == "jack"] <- 10
  deck$value[deck$face == "ace"] <- 11
}
play <- function(){
  deal <- function(){
    assign("deck", deck[-1,], parent.env(environment()))
    card <- deck[1,]
  }
  shuffle <- function(deck){
    Deck <- read.csv("deck.csv")
    random <- sample(1:52, size = 52)
    assign("deck", Deck[random,], parent.env(environment()))
  }
  shuffle(deck)
  dealer_card_1 <- deal()
  dealer_card_2 <- deal()
  print(dealer_card_1)
  #print(dealer_card_2)
  dealer_hand <- dealer_card_1$value + dealer_card_2$value
  #print(dealer_hand)
  dealer_card_3 <- NA
  dealer_cards <- list(dealer_card_1, dealer_card_2, dealer_card_3)
  if(dealer_hand < 17){
    dealer_card_3 <- deal()
    dealer_hand <- dealer_hand + dealer_card_3$value
    dealer_cards <- list(dealer_card_1, dealer_card_2, dealer_card_3)
  }
  if(dealer_hand > 21){
    deck$value[deck$face == "ace"] <- 1
  }
  print(dealer_cards)
  if(dealer_hand > 21){
    print("player wins")
  }else{
    print("dealer wins") 
  }
}
