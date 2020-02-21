class Playlist
  def initialize(data)
    @name = data[:name]
    @id = data[:id]
    @owner = data[:owner][:id]
  end
end