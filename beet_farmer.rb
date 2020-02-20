require 'sinatra/base'
require 'bundler'
require 'sinatra/activerecord'

Bundler.require

class BeetFarmer < Sinatra::Base
  get '/' do
    "BEET FARMER READY TO TURNIP THE BEET"
  end
end
