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
    get_json("/v1/search?query=#{single_mood}%20#{cuisine}&type=playlist&offset=0&limit=25")
  end

  def mood_query
    single_query(single_mood)
  end

  def cuisine_query
    single_query(single_cuisine)
  end

  private

  def single_mood
    return 'jazz' if mood == 'jazzy'
    return 'sad' if mood == 'glum'
    return 'classical' if mood == 'classy'
    return 'folk' if mood == 'folksy'
    return 'summer' if mood == 'sunny'
    return 'romance' if mood == 'romantic'
    return mood
  end

  def single_cuisine
    return 'ital' if cuisine == 'italian'
    return 'mexi' if cuisine == 'mexican'
    return 'india%20desi' if cuisine == 'indian'
    return 'america' if cuisine == 'american'
    return 'japan' if cuisine == 'japanese'
    return 'viet' if cuisine == 'vietnamese'
    return 'greek%20dinner' if cuisine == 'greek'
    return 'french%20dinner' if cuisine == 'french'
    return cuisine
  end

  def single_query(param)
    get_json("/v1/search?query=#{param}&type=playlist&offset=0&limit=50")
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
