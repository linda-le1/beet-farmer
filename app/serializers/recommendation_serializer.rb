class RecommendationSerializer

  def self.parse(playlist)
    playlist.reduce([]) do |acc, playlist|
      acc << {id: playlist.id, name: playlist.name, url: playlist.url}
      acc
    end
  end

  def self.jsonify(recommendation)
    {
      data: {
        mood: {
          type: recommendation.mood,
          playlists: parse(recommendation.mood_playlists)
        },
        cuisine: {
          type: recommendation.cuisine,
          playlists: parse(recommendation.cuisine_playlists)
        },
        combos: {
          type: [recommendation.mood, recommendation.cuisine],
          playlists: parse(recommendation.combo_playlists)
        }
      }
    }.to_json
  end
end