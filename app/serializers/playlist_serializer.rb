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
          playlists: collection[0]
        },
        cuisine: {
          type: cuisine,
          playlists: collection[1]
        },
        combos: {
          type: [mood, cuisine],
          playlists: collection[2]
        }
      }
    }.to_json
  end
end