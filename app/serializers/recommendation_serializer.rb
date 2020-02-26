class RecommendationSerializer

  def self.parse(playlist)
    playlist.reduce([]) do |acc, playlist|
      acc << {id: playlist.id, name: playlist.name}
      acc
    end
  end

  def self.jsonify(rec)
    {
      data: {
        mood: {
          type: rec.mood.capitalize,
          playlists: parse(rec.mood_playlists)
        },
        cuisine: {
          type: rec.cuisine.capitalize,
          playlists: parse(rec.cuisine_playlists)
        },
        combos: {
          type: rec.mood.capitalize + " " + rec.cuisine.capitalize,
          playlists: parse(rec.combo_playlists)
        }
      }
    }.to_json
  end
end