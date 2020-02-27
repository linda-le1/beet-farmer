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
    redis_key = "#{mood} #{cuisine}"
    redis = Redis.new
    if redis.get(redis_key)
      eval(redis.get(redis_key))
    else
      combo = get_json("/v1/search?query=#{single_mood}%20#{cuisine}&type=playlist&offset=0&limit=25")
      redis.set(redis_key, combo, ex: cache_expire)
      combo
    end
  end

  def mood_query
    redis = Redis.new
    if redis.get(mood)
      eval(redis.get(mood))
    else
      redis.set(mood, single_query(single_mood), ex: cache_expire)
      single_query(single_mood)
    end
  end

  def cuisine_query
    redis = Redis.new
    if redis.get(cuisine)
      eval(redis.get(cuisine))
    else
      redis.set(cuisine, single_query(single_cuisine), ex: cache_expire)
      single_query(single_cuisine)
    end
  end

  private

  def cache_expire
    60*60*24
  end

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
