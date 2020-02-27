require 'faraday'
require './app/modules/query_converter'
# require 'dotenv/load'

class SpotifyService
  include QueryConverter
  attr_reader :token, :mood, :cuisine

  def initialize(params)
    @token = params[:token]
    @mood = params[:mood]
    @cuisine = params[:cuisine]
  end

  def combo_query
    get_json("/v1/search?query=#{single_mood}%20#{cuisine}&type=playlist&offset=0&limit=25")
  end

  def mood_query
    single_query(single_mood)
  end

  def cuisine_query
    single_query(single_cuisine)
  end

  private

  def single_query(param)
    get_json("/v1/search?query=#{param}&type=playlist&limit=50")
  end

  def get_json(uri)
    response = conn.get(uri)
    JSON.parse(response.body, symbolize_names: true)
  end

  def conn
    Faraday.new('https://api.spotify.com') do |f|
      f.adapter Faraday.default_adapter
      f.headers['Authorization'] = "Bearer #{token}"
    end
  end
end
