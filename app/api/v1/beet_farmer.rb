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

    mood_response = service.get_json('/v1/browse/categories/chill/playlists?limit=50')
    mood_playlists = mood_response[:playlists][:items].map do |playlist_data|
      Playlist.new(playlist_data) if playlist_data[:owner][:id] == 'spotify'
    end.compact

    cuisine_response = service.get_json('/v1/search?query=mexican&type=playlist&offset=0&limit=50')
    cuisine_playlists = cuisine_response[:playlists][:items].map do |playlist_data|
      Playlist.new(playlist_data) if playlist_data[:owner][:id] == 'spotify'
    end.compact
  end
end
