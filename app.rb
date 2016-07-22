#!/usr/bin/env ruby
# app.rb

require 'sinatra'
require './helpers/deck.rb'
require './helpers/game_helper.rb'

helpers GameHelper
enable :sessions

get '/' do
  erb :home
end

get '/blackjack' do
  @deck = Deck.new
  @dealer_hand = @deck.deal
  @player_hand = @deck.deal
  save_game(@deck, @dealer_hand, @player_hand)

  erb :blackjack, locals: { dealer_hand: @dealer_hand, player_hand: @player_hand }
end

post '/blackjack' do
  game = load_game
  @deck = game[:deal]
  @player_hand = game[:player_hand]
  @dealer_hand = game[:dealer_hand]

  @player_hand = @deck.hit if params[:move] == "hit"

  erb :blackjack, locals: { dealer_hand: @dealer_hand, player_hand: @player_hand }
end
