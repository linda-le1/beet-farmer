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
    if mood == 'romantic'
      mood_array.map { |data| Playlist.new(data) }
    else
      mood_array.map {|data| Playlist.new(data) if owner_spotify?(data) }
    end.compact.sample(limit)
  end

  def cuisine_playlists
    if cuisine == 'greek' || cuisine == 'french'
      cuisine_array.map { |data| Playlist.new(data) }
    else
      cuisine_array.map { |data| Playlist.new(data) if owner_spotify?(data) }
    end.compact.sample(limit)
  end

  def combo_playlists
    combos_array.map { |data| Playlist.new(data) }.compact.sample(limit)
  end

  private

  def mood_array
    service.mood_query[:playlists][:items]
  end

  def cuisine_array
    service.cuisine_query[:playlists][:items]
  end

  def combos_array
    service.combo_query[:playlists][:items]
  end

  def owner_spotify?(data)
    data[:owner][:id] == ('spotify' || 'spotifycharts')
  end

  def service
    return @service if @service
    @service = SpotifyService.new(params)
  end

  def limit
    5
  end
end