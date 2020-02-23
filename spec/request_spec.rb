require 'spec_helper'
require './app/api/v1/beet_farmer'

RSpec.describe 'Beet Farmer API' do

  def app
    BeetFarmer
  end

  it 'can return a recommendation' do
    get '/api/v1/recommend'

    expect(last_response).to be_successful

    result = JSON.parse(last_response.body, symbolize_names: true)

    expect(result[:data][:mood][:type]).to eq 'chill'
    expect(result[:data][:cuisine][:type]).to eq 'italian'
    expect(result[:data][:combos][:type]).to eq ['chill', 'italian']
  end
end