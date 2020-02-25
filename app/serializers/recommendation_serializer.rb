class RecommendationSerializer

  def self.parse(playlist)
    playlist.reduce([]) do |acc, playlist|
      acc << {id: playlist.id, name: playlist.name, widget_url: playlist.url}
      acc
    end
  end

  def self.jsonify(recommendation)
    {
      data: {
        mood: {
          type: recommendation.mood.capitalize,
          playlists: parse(recommendation.mood_playlists)
        },
        cuisine: {
          type: recommendation.cuisine.capitalize,
          playlists: parse(recommendation.cuisine_playlists)
        },
        combos: {
          type: [recommendation.mood.capitalize, recommendation.cuisine.capitalize],
          playlists: parse(recommendation.combo_playlists)
        }
      }
    }.to_json
  end
end