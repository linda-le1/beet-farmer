require 'spec_helper'
require './app/api/v1/beet_farmer'

RSpec.describe 'Beet Farmer API' do

  def app
    BeetFarmer
  end

  it 'can return a romantic french recommendation' do
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

    expect(result[:combos][:type]).to eq mood.capitalize + " " + cuisine.capitalize
    expect(result[:combos][:playlists].length).to_not eq 0
  end

  it 'can return a chill greek recommendation' do
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

    expect(result[:combos][:type]).to eq mood.capitalize + " " + cuisine.capitalize
    expect(result[:combos][:playlists].length).to_not eq 0
  end

  it 'can return a glum greek recommendation' do
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

    expect(result[:combos][:type]).to eq mood.capitalize + " " + cuisine.capitalize
    expect(result[:combos][:playlists].length).to_not eq 0
  end

  it 'can return a classy mexican recommendation' do
    mood = 'classy'
    cuisine = 'mexican'
    token = ENV['SPOTIFY_TOKEN']

    get "/api/v1/recommend?mood=#{mood}&cuisine=#{cuisine}&token=#{token}"
    expect(last_response).to be_successful

    result = JSON.parse(last_response.body, symbolize_names: true)[:data]

    expect(result[:mood][:type]).to eq mood.capitalize
    expect(result[:mood][:playlists].length).to eq 5

    expect(result[:cuisine][:type]).to eq cuisine.capitalize
    expect(result[:cuisine][:playlists].length).to eq 5

    expect(result[:combos][:type]).to eq mood.capitalize + " " + cuisine.capitalize
    expect(result[:combos][:playlists].length).to_not eq 0
  end

  it 'can return a folksy latin recommendation' do
    mood = 'folksy'
    cuisine = 'latin'
    token = ENV['SPOTIFY_TOKEN']

    get "/api/v1/recommend?mood=#{mood}&cuisine=#{cuisine}&token=#{token}"
    expect(last_response).to be_successful

    result = JSON.parse(last_response.body, symbolize_names: true)[:data]

    expect(result[:mood][:type]).to eq mood.capitalize
    expect(result[:mood][:playlists].length).to eq 5

    expect(result[:cuisine][:type]).to eq cuisine.capitalize
    expect(result[:cuisine][:playlists].length).to eq 5

    expect(result[:combos][:type]).to eq mood.capitalize + " " + cuisine.capitalize
    expect(result[:combos][:playlists].length).to_not eq 0
  end

  it 'can return a jazzy korean recommendation' do
    mood = 'jazzy'
    cuisine = 'korean'
    token = ENV['SPOTIFY_TOKEN']

    get "/api/v1/recommend?mood=#{mood}&cuisine=#{cuisine}&token=#{token}"
    expect(last_response).to be_successful

    result = JSON.parse(last_response.body, symbolize_names: true)[:data]

    expect(result[:mood][:type]).to eq mood.capitalize
    expect(result[:mood][:playlists].length).to eq 5

    expect(result[:cuisine][:type]).to eq cuisine.capitalize
    expect(result[:cuisine][:playlists].length).to eq 5

    expect(result[:combos][:type]).to eq mood.capitalize + " " + cuisine.capitalize
    expect(result[:combos][:playlists].length).to_not eq 0
  end

  it 'can return a sunny french recommendation' do
    mood = 'sunny'
    cuisine = 'french'
    token = ENV['SPOTIFY_TOKEN']

    get "/api/v1/recommend?mood=#{mood}&cuisine=#{cuisine}&token=#{token}"
    expect(last_response).to be_successful

    result = JSON.parse(last_response.body, symbolize_names: true)[:data]

    expect(result[:mood][:type]).to eq mood.capitalize
    expect(result[:mood][:playlists].length).to eq 5

    expect(result[:cuisine][:type]).to eq cuisine.capitalize
    expect(result[:cuisine][:playlists].length).to eq 5

    expect(result[:combos][:type]).to eq mood.capitalize + " " + cuisine.capitalize
    expect(result[:combos][:playlists].length).to_not eq 0
  end

  it 'can return a folksy thai recommendation' do
    mood = 'folksy'
    cuisine = 'thai'
    token = ENV['SPOTIFY_TOKEN']

    get "/api/v1/recommend?mood=#{mood}&cuisine=#{cuisine}&token=#{token}"
    expect(last_response).to be_successful

    result = JSON.parse(last_response.body, symbolize_names: true)[:data]

    expect(result[:mood][:type]).to eq mood.capitalize
    expect(result[:mood][:playlists].length).to eq 5

    expect(result[:cuisine][:type]).to eq cuisine.capitalize
    expect(result[:cuisine][:playlists].length).to eq 4

    expect(result[:combos][:type]).to eq mood.capitalize + " " + cuisine.capitalize
    expect(result[:combos][:playlists].length).to_not eq 0
  end

  it 'can return a classy bbq recommendation' do
    mood = 'classy'
    cuisine = 'bbq'
    token = ENV['SPOTIFY_TOKEN']

    get "/api/v1/recommend?mood=#{mood}&cuisine=#{cuisine}&token=#{token}"
    expect(last_response).to be_successful

    result = JSON.parse(last_response.body, symbolize_names: true)[:data]

    expect(result[:mood][:type]).to eq mood.capitalize
    expect(result[:mood][:playlists].length).to eq 5

    expect(result[:cuisine][:type]).to eq cuisine.capitalize
    expect(result[:cuisine][:playlists].length).to eq 5

    expect(result[:combos][:type]).to eq mood.capitalize + " " + cuisine.capitalize
    expect(result[:combos][:playlists].length).to_not eq 0
  end
end
