class Playlist
  attr_reader :id, :name, :url

  def initialize(data)
    @name = data[:name]
    @id = data[:id]
    @owner = data[:owner][:id]
    @url = data[:external_urls][:spotify]
  end
end