class PlaylistSerializer

  def self.hashify(playlists)
    playlists.reduce([]) do |acc, playlist|
      acc << {id: playlist.id, name: playlist.name, url: playlist.url}
      acc
    end
  end

  def self.jsonify(mood, cuisine, collection)
    {
      data: {
        mood: {
          type: mood,
          playlists: hashify(collection[:moods])
        },
        cuisine: {
          type: cuisine,
          playlists: hashify(collection[:cuisines])
        },
        combos: {
          type: [mood, cuisine],
          playlists: hashify(collection[:combos])
        }
      }
    }.to_json
  end
end