require 'faraday'
# require 'dotenv/load'

class SpotifyService
  attr_reader :token, :mood, :cuisine

  def initialize(params)
    @token = params[:token]
    @mood = params[:mood]
    @cuisine = params[:cuisine]
  end

  def combo_query
    get_json("/v1/search?query=#{mood}%20#{cuisine}&type=playlist&offset=0&limit=25")
  end

  def mood_query
    case mood
    when 'romantic'
      romantic_query
    else
      single_query(mood)
    end
  end

  def cuisine_query
    case cuisine
    when 'greek'
      greek_query
    when 'french'
      french_query
    else
      single_query(cuisine)
    end
  end

  private

  def single_query(param)
    get_json("/v1/search?query=#{param}&type=playlist&offset=0&limit=50")
  end

  def greek_query
    get_json("/v1/search?query=greek%20dinner&type=playlist&offset=0&limit=10")
  end

  def french_query
    get_json("/v1/search?query=french%20dinner&type=playlist&offset=0&limit=10")
  end

  def romantic_query
    get_json("/v1/search?query=date%night&type=playlist&offset=0&limit=50")
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
