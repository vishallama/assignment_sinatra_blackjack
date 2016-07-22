#!/usr/bin/env ruby
# app.rb

require 'sinatra'

get '/' do
  erb :home
end
