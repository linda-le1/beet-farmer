require 'spec_helper'
require 'dotenv/load'
require './app/services/spotify_service.rb'

describe "Spotify Service", :vcr do
  it 'returns the correct number of playlists' do
    params = {
      token: ENV['SPOTIFY_TOKEN'],
      mood: 'chill',
      cuisine: 'italian'
    }

    spotify = SpotifyService.new(params)

    combo_hash = spotify.combo_query[:playlists][:items]
    mood_hash = spotify.mood_query[:playlists][:items]
    cuisine_hash = spotify.cuisine_query[:playlists][:items]

    expect(combo_hash.length).to eq 25
    expect(mood_hash.length).to eq 50
    expect(cuisine_hash.length).to eq 50
  end
end