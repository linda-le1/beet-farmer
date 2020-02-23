require 'spec_helper'
require './app/api/v1/beet_farmer'

RSpec.describe 'Beet Farmer API' do

  def app
    BeetFarmer
  end

  it 'can return a home string' do
    get '/api/v1/recommend'

    expect(last_response).to be_successful
  end
end