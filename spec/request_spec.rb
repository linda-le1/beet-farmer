# ENV['RACK_ENV'] = 'test'
# require 'rspec'
# require 'rack/test'
# require 'bundler'
# require_relative '../beet_farmer.rb'
require 'pry'

include Rack::Test::Methods

require 'spec_helper'

def app
  Sinatra::Application
end

RSpec.describe 'Beet Farmer API' do
  it 'can return a home string' do
    service = BeetFarmer.new


  end
end