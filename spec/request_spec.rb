require 'spec_helper'
require './app/api/v1/beet_farmer'

RSpec.describe 'Beet Farmer API' do

  def app
    BeetFarmer
  end

  it 'can return a recommendation' do
    mood = 'romantic'
    cuisine = 'french'
    token = ENV['SPOTIFY_TOKEN']

    get "/api/v1/recommend?mood=#{mood}&cuisine=#{cuisine}&token=#{token}"
    expect(last_response).to be_successful

    result = JSON.parse(last_response.body, symbolize_names: true)[:data]

    expect(result[:mood][:type]).to eq mood
    expect(result[:mood][:playlists].length).to eq 5

    expect(result[:cuisine][:type]).to eq cuisine
    expect(result[:cuisine][:playlists].length).to eq 5

    expect(result[:combos][:type]).to eq ["#{mood}", "#{cuisine}"]
    expect(result[:combos][:playlists].length).to eq 5
  end
end