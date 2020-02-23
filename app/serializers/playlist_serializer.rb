class PlaylistSerializer

  def self.jsonify(playlists)
    playlists.reduce([]) do |acc, playlist|
      acc << {id: playlist.id, name: playlist.name, url: playlist.url}
      acc
    end
  end
end