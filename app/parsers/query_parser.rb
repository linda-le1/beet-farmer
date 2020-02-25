require './app/services/spotify_service'
require './app/poros/playlist'

class QueryParser
  attr_reader :params, :mood, :cuisine

  def initialize(params)
    @mood = params[:mood]
    @cuisine = params[:cuisine]
    @params = params
  end

  def mood_playlists
    case mood
    when 'romantic'
      service.mood_query[:playlists][:items].map do |data|
        Playlist.new(data)
      end.compact.sample(limit)
    else
      service.mood_query[:playlists][:items].map do |data|
        Playlist.new(data) if data[:owner][:id] == ('spotify' || 'spotifycharts')
      end.compact.sample(limit)
    end
  end

  def cuisine_playlists
    case cuisine
    when 'greek'
      service.cuisine_query[:playlists][:items].map do |data|
        Playlist.new(data)
      end.compact.sample(limit)
    when 'french'
      service.cuisine_query[:playlists][:items].map do |data|
        Playlist.new(data)
      end.compact.sample(limit)
    else
      service.cuisine_query[:playlists][:items].map do |data|
        Playlist.new(data) if data[:owner][:id] == ('spotify' || 'spotifycharts')
      end.compact.sample(limit)
    end
  end

  def combo_playlists
    service.combo_query[:playlists][:items].map do |data|
      Playlist.new(data)
    end.compact.sample(limit)
  end

  private

  def service
    return @service if @service
    @service = SpotifyService.new(params)
  end

  def limit
    5
  end
end