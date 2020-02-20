require 'sinatra/base'
require 'bundler'

Bundler.require

class BeetFarmer < Sinatra::Base
  get '/' do
    "BEET FARMER READY TO TURNIP THE BEET"
  end
end
