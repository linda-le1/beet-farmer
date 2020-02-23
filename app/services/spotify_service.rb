require 'faraday'
require 'dotenv/load'

class SpotifyService
  attr_reader :token

  def initialize(token)
    @token = token
  end

  def combos(mood, cuisine)
    json = get_json("/v1/search?query=#{mood}%20#{cuisine}&type=playlist&offset=0&limit=50")
    playlists = json[:playlists][:items].map do |data|
      Playlist.new(data)
    end
    playlists.compact.sample(5)
  end

  def moods(mood)
    json = get_json("/v1/search?query=#{mood}&type=playlist&offset=0&limit=50")
    playlists = json[:playlists][:items].map do |data|
      Playlist.new(data) if data[:owner][:id].include?('spotify')
    end
    playlists.compact.sample(5)
  end

  def cuisines(cuisine)
    json = get_json("/v1/search?query=#{cuisine}&type=playlist&offset=0&limit=50")
    playlists = json[:playlists][:items].map do |data|
      Playlist.new(data) if data[:owner][:id].include?('spotify')
    end
    playlists.compact.sample(5)
  end

  private

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