class RecommendationSerializer

  def self.parse(playlist)
    playlist.reduce([]) do |acc, playlist|
      acc << {id: playlist.id, name: playlist.name, url: playlist.url}
      acc
    end
  end

  def self.jsonify(recommendation)
    mood = recommendation.params[:mood]
    cuisine = recommendation.params[:cuisine]

    {
      data: {
        mood: {
          type: mood,
          playlists: parse(recommendation.mood_playlists)
        },
        cuisine: {
          type: cuisine,
          playlists: parse(recommendation.cuisine_playlists)
        },
        combos: {
          type: [mood, cuisine],
          playlists: parse(recommendation.combo_playlists)
        }
      }
    }.to_json
  end
end