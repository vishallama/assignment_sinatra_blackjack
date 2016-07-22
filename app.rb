#!/usr/bin/env ruby
# app.rb

require 'sinatra'
require './helpers/deck.rb'

enable :sessions

get '/' do
  erb :home
end

get '/blackjack' do
  @deck = Deck.deck

  erb :blackjack  
end

post '/blackjack' do
  
end

