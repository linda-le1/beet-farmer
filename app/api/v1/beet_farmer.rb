require 'sinatra/base'
require 'bundler'
require 'faraday'
require 'json'

require './app/services/spotify_service'
require './app/poros/playlist'
require './app/poros/recommendation'
require './app/serializers/recommendation_serializer'

Bundler.require

class BeetFarmer < Sinatra::Base
  get('/api/v1/recommend') do
    content_type :json
    recommendation = Recommendation.new(params)
    RecommendationSerializer.jsonify(recommendation)
  end
end
