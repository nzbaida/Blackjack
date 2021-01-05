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
      player_card_1 <- deal()
      player_card_2 <- deal()
      print("player cards")
      print(player_card_1)
      print(player_card_2)
      player_card_3 <- NA
      player_card_4 <- NA
      player_card_5 <- NA
      player_card_6 <- NA
      player_card_7 <- NA
      player_card_8 <- NA
      player_card_9 <- NA
      player_cards <- list(player_card_1, player_card_2, player_card_3, player_card_4, player_card_5, player_card_6, player_card_7,player_card_8, player_card_9)
      player_hand <- player_card_1$value + player_card_2$value
      i <- 3
      while(i < 10){
        input2 <- readline("type hit for more cards")
        if(input2 == "hit"){
          player_cards[[i]] <- deal()
          player_hand <- player_hand + player_cards[[i]][3]
        }else{
          break
        }
        print(player_cards[[i]])
        i <- i + 1
      }
      if(player_hand > 21){
        length <- sum(player_cards[is.na(player_cards) == FALSE])
        for(i in 1:length){
          if(is.na(player_cards[[i]][1]) == "ace"){
            player_cards[[i]][3] <- 1
          }
        }
      }
      print("player cards")
      print(player_cards[is.na(player_cards) == FALSE])
      print("dealer cards")
      print(dealer_cards[is.na(dealer_cards) == FALSE])
      if(player_hand > dealer_hand & player_hand <= 21){
        print("player wins")
      }else if(player_hand < dealer_hand & dealer_hand <= 21){
        print("house wins")
      }
      if(dealer_hand > 21){
        print("house busts")
        print("player wins")
      }else if(player_hand > 21){
        print("player busts")
        print("house wins")
      }else if(player_hand > 21 & player_hand > 21){
        print("both bust")
      }
    }
  }
}
