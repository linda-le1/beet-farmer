require 'sinatra/base'
require 'bundler'
# require 'sinatra/activerecord'
require 'pry'
require 'faraday'
require 'json'
require 'dotenv/load'

require './app/services/spotify_service'
require './app/poros/playlist'

Bundler.require

class BeetFarmer < Sinatra::Base
  get('/api/v1/recommend') do
    content_type :json
    service = SpotifyService.new(ENV['SPOTIFY_TOKEN'])

    mood = 'chill'
    cuisine = 'italian'

    combo_playlists = service.combos(mood, cuisine)
    combo_arr = []
    combo_playlists.each do |playlist|
      combo_arr << {id: playlist.id, name: playlist.name, url: playlist.url}
    end

    mood_playlists = service.moods(mood)
    mood_arr = []
    mood_playlists.each do |playlist|
      mood_arr << {id: playlist.id, name: playlist.name, url: playlist.url}
    end

    cuisine_playlists = service.cuisines(cuisine)
    cuisine_arr = []
    cuisine_playlists.each do |playlist|
      cuisine_arr << {id: playlist.id, name: playlist.name, url: playlist.url}
    end

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
