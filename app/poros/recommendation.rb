require './app/services/spotify_service'
require './app/poros/playlist'

class Recommendation
  attr_reader :params, :mood, :cuisine

  def initialize(params)
    @mood = params[:mood]
    @cuisine = params[:cuisine]
    @params = params
  end

  def mood_playlists
    case mood
    when 'romantic'
      select_all(mood_array)
    else
      select_spotify(mood_array)
    end.compact.sample(limit)
  end

  def cuisine_playlists
    case cuisine
    when 'greek', 'french'
      select_all(cuisine_array)
    else
      select_spotify(cuisine_array)
    end.compact.sample(limit)
  end

  def combo_playlists
    select_all(combos_array).compact.sample(limit)
  end

  private

  def select_all(array)
    array.map { |data| Playlist.new(data) }
  end

  def select_spotify(array)
    array.map { |data| Playlist.new(data) if owner_spotify?(data) }
  end

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
    data[:owner][:id] == 'spotify' || data[:owner][:id] == 'spotifycharts'
  end

  def service
    @service ||= SpotifyService.new(params)
  end

  def limit
    5
  end
end
