require 'sinatra/base'
require 'bundler'
require 'sinatra/activerecord'
require 'pry'
require 'faraday'
require 'json'
require 'dotenv/load'

require './app/services/spotify_service'
require './app/poros/playlist'

Bundler.require

class BeetFarmer < Sinatra::Base
  get '/api/v1' do
    service = SpotifyService.new(ENV['SPOTIFY_TOKEN'])

    mood = 'sad'
    cuisine = 'greek'
    category = 'dinner'

    combos = service.combos(mood, cuisine)
    moods = service.moods(mood)
    cuisines = service.cuisines(cuisine)
  end
end
