require 'spec_helper'
require 'dotenv/load'
require './app/parsers/query_parser.rb'

describe "Query Parser" do
  it 'returns the correct number of playlist objects' do
    params = {
      token: ENV['SPOTIFY_TOKEN'],
      mood: 'chill',
      cuisine: 'italian'
    }

    query = QueryParser.new(params)

    mood_playlists = query.mood_playlists
    cuisine_playlists = query.cuisine_playlists
    combo_playlists = query.combo_playlists

    expect(mood_playlists.length).to eq 5
    expect(cuisine_playlists.length).to eq 5
    expect(combo_playlists.length).to eq 5

    mood_playlists.each do |playlist|
      expect(playlist.owner).to eq('spotify' || 'spotifycharts')
    end

    cuisine_playlists.each do |playlist|
      expect(playlist.owner).to eq('spotify' || 'spotifycharts')
    end
  end
end