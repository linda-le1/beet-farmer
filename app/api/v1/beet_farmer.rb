require 'sinatra/base'
require 'bundler'
# require 'sinatra/activerecord'
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
    service = SpotifyService.new(ENV['SPOTIFY_TOKEN'])

    mood = 'chill'
    cuisine = 'italian'

    combo_playlists = service.combos(mood, cuisine)
    mood_playlists = service.moods(mood)
    cuisine_playlists = service.cuisines(cuisine)

    combo_arr = PlaylistSerializer.jsonify(combo_playlists)
    mood_arr = PlaylistSerializer.jsonify(mood_playlists)
    cuisine_arr = PlaylistSerializer.jsonify(cuisine_playlists)

    json = {
      data: {
        mood: {
          type: mood,
          playlists: mood_arr
        },
        cuisine: {
          type: cuisine,
          playlists: cuisine_arr
        },
        combos: {
          type: [mood, cuisine],
          playlists: combo_arr
        }
      }
    }.to_json
  end
end
