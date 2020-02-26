class Playlist
  attr_reader :id, :name, :url, :owner

  def initialize(data)
    @name = data[:name]
    @id = data[:id]
    @owner = data[:owner][:id]
    @url = "https://open.spotify.com/embed/playlist/#{data[:id]}"
  end
end