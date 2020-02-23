require 'sinatra/base'
require 'bundler'
require 'pry'
require 'faraday'
require 'json'
require 'dotenv/load'

require './app/services/spotify_service'
require './app/poros/playlist'
require './app/serializers/playlist_serializer'

Bundler.require

class BeetFarmer < Sinatra::Base
  get('/api/v1/recommend') do
    content_type :json

    mood = params["mood"]
    cuisine = params["cuisine"]
    token = params["token"]

    service = SpotifyService.new(token)

    combo_playlists = service.combo_query(mood, cuisine)
    mood_playlists = service.single_query(mood)
    cuisine_playlists = service.single_query(cuisine)

    collection = []
    collection << PlaylistSerializer.hashify(mood_playlists)
    collection << PlaylistSerializer.hashify(cuisine_playlists)
    collection << PlaylistSerializer.hashify(combo_playlists)
    PlaylistSerializer.jsonify(mood, cuisine, collection)
  end
end
