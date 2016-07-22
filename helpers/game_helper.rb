module GameHelper
  def save_game(deck, dealer_hand, player_hand)
    session[:deck] = deck
    session[:dealer_hand] = dealer_hand
    session[:player_hand] = player_hand
  end

  def load_game
    game[:deck] = session[:deck]
    game[:dealer_hand] = session[:dealer_hand]
    game[:player_hand] = session[:player_hand]
    game
  end
end
