require 'faraday'
# require 'dotenv/load'

class SpotifyService
  attr_reader :token

  def initialize(token)
    @token = token
  end

  def combo_query(mood, cuisine, limit = 5)
    json = get_json("/v1/search?query=#{mood}%20#{cuisine}&type=playlist&offset=0&limit=25")
    objectify(json).compact.sample(limit)
  end

  def single_query(param, limit = 5)
    if param == 'greek'
      playlists = greek_query
    elsif param == 'french'
      playlists = french_query
    elsif param == 'romantic'
      playlists = romantic_query
    else
      json = get_json("/v1/search?query=#{param}&type=playlist&offset=0&limit=50")
      playlists = filter_by_spotify?(json)
    end
    playlists.compact.sample(limit)
  end

  private

  def greek_query
    json = get_json("/v1/search?query=greek%20dinner&type=playlist&offset=0&limit=10")
    objectify(json)
  end

  def french_query
    json = get_json("/v1/search?query=french%20dinner&type=playlist&offset=0&limit=10")
    objectify(json)
  end

  def romantic_query
    json = get_json("/v1/search?query=date%night&type=playlist&offset=0&limit=50")
    objectify(json)
  end

  def filter_by_spotify(json)
    json[:playlists][:items].map do |data|
      Playlist.new(data) if by_spotify?(data)
    end
  end

  def by_spotify?(data)
    data[:owner][:id].include?('spotify')
  end

  def objectify(json)
    playlists = json[:playlists][:items].map do |data|
      Playlist.new(data)
    end
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
