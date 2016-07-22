#!/usr/bin/env ruby
# app.rb

require 'sinatra'
require './helpers/deck.rb'
require './helpers/game_helper.rb'
require 'pry-byebug'

helpers GameHelper
enable :sessions

get '/' do
  erb :home
end

get '/blackjack' do
  @deck = Deck.new
  @dealer_hand = @deck.deal
  @player_hand = @deck.deal
  save_game(@deck.deck, @dealer_hand, @player_hand)

  erb :blackjack, locals: { dealer_hand: @dealer_hand, player_hand: @player_hand }
end

post '/blackjack' do
  game = load_game
  @deck = Deck.new(game[:deck])
  @player_hand = game[:player_hand]
  @dealer_hand = game[:dealer_hand]
  save_game(@deck.deck, @dealer_hand, @player_hand)
  # @player_hand = @deck.hit if params[:move] == "hit"

  erb :blackjack, locals: { dealer_hand: @dealer_hand,
                            player_hand: @player_hand }
end

post '/blackjack/hit' do
  game = load_game
  @deck = Deck.new(game[:deck])
  @player_hand = game[:player_hand]
  @dealer_hand = game[:dealer_hand]

  @player_hand << @deck.hit unless @deck.empty?

  if hand_total(@player_hand) > 21
    @deck.push(@player_hand.pop)
    redirect to('/blackjack/stay')
  end

  save_game(@deck.deck, @dealer_hand, @player_hand)
  erb :blackjack, locals: { dealer_hand: @dealer_hand,
                            player_hand: @player_hand }
end

post '/blackjack/stay' do
  game = load_game
  @deck = Deck.new(game[:deck])
  @player_hand = game[:player_hand]
  @dealer_hand = game[:dealer_hand]



end
