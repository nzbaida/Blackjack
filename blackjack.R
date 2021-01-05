play <- function(){
  setwd("C:/Users/natty/Desktop/R Practice")
  deck <- read.csv("deck.csv")
  deck$value[deck$face == "king" | deck$face == "queen" | deck$face == "jack"] <- 10
  deck$value[deck$face == "ace"] <- 11
  assign("Deck", deck, envir = parent.env(environment()))
  deal <- function(){
    assign("Deck", Deck[-1,], parent.env(parent.env(environment())))
    card <- Deck[1,]
  }
  shuffle <- function(deck){
    Deck <- read.csv("deck.csv")
    Deck$value[Deck$face == "king" | Deck$face == "queen" | Deck$face == "jack"] <- 10
    Deck$value[Deck$face == "ace"] <- 11
    random <- sample(1:52, size = 52)
    assign("Deck", Deck[random,], parent.env(parent.env(environment())))
  }
  repeat{
    input1 <- readline("type finish to stop")
    if(input1 == "finish"){
      break
    }else{
      shuffle(Deck)
      dealer_card_1 <- deal()
      dealer_card_2 <- deal()
      print("dealer top card")
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
      print("dealer cards")
      print(dealer_cards[is.na(dealer_cards) == FALSE])
      if(dealer_hand > 21){
        print("house busts")
        print("player wins")
      }
    }
  }
}
