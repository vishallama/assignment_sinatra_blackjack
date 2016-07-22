#!/usr/bin/env ruby
# app.rb

require 'sinatra'

get '/' do
  erb :home
end

get '/blackjack' do
  erb :blackjack  
end

