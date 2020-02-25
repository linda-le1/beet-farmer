require 'spec_helper'
require './app/api/v1/beet_farmer'

RSpec.describe 'Beet Farmer API', :vcr do

  def app
    BeetFarmer
  end

  it 'can return a recommendation based on params' do
    mood = 'romantic'
    cuisine = 'french'
    token = ENV['SPOTIFY_TOKEN']

    get "/api/v1/recommend?mood=#{mood}&cuisine=#{cuisine}&token=#{token}"
    expect(last_response).to be_successful

    result = JSON.parse(last_response.body, symbolize_names: true)[:data]

    expect(result[:mood][:type]).to eq mood.capitalize
    expect(result[:mood][:playlists].length).to eq 5

    expect(result[:cuisine][:type]).to eq cuisine.capitalize
    expect(result[:cuisine][:playlists].length).to eq 5

    expect(result[:combos][:type]).to eq ["#{mood.capitalize}", "#{cuisine.capitalize}"]
    expect(result[:combos][:playlists].length).to eq 5
  end

  it 'can return a recommendation based on different params' do
    mood = 'chill'
    cuisine = 'greek'
    token = ENV['SPOTIFY_TOKEN']

    get "/api/v1/recommend?mood=#{mood}&cuisine=#{cuisine}&token=#{token}"
    expect(last_response).to be_successful

    result = JSON.parse(last_response.body, symbolize_names: true)[:data]

    expect(result[:mood][:type]).to eq mood.capitalize
    expect(result[:mood][:playlists].length).to eq 5

    expect(result[:cuisine][:type]).to eq cuisine.capitalize
    expect(result[:cuisine][:playlists].length).to eq 5

    expect(result[:combos][:type]).to eq ["#{mood.capitalize}", "#{cuisine.capitalize}"]
    expect(result[:combos][:playlists].length).to eq 5
  end

  it 'can return another recommendation based on another set of params' do
    mood = 'glum'
    cuisine = 'greek'
    token = ENV['SPOTIFY_TOKEN']

    get "/api/v1/recommend?mood=#{mood}&cuisine=#{cuisine}&token=#{token}"
    expect(last_response).to be_successful

    result = JSON.parse(last_response.body, symbolize_names: true)[:data]

    expect(result[:mood][:type]).to eq mood.capitalize
    expect(result[:mood][:playlists].length).to eq 5

    expect(result[:cuisine][:type]).to eq cuisine.capitalize
    expect(result[:cuisine][:playlists].length).to eq 5

    expect(result[:combos][:type]).to eq ["#{mood.capitalize}", "#{cuisine.capitalize}"]
    expect(result[:combos][:playlists].length).to eq 5
  end
end
