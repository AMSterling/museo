class Curator
  attr_reader :photographs, :artists

  def initialize
    @photographs = []
    @artists = []
  end

  def add_photograph(photo)
    @photographs << photo
  end

  def add_artist(artist)
    @artists << artist
  end

  def find_artist_by_id(id)
    artists.select { |pic| pic.id == id}.reduce
  end

  def photographs_by_artist
    photos = Hash.new
    @artists.map do |artist|
    photos[artist] = @photographs.select {|photo| photo.artist_id == artist.id}
    end
    photos
  end

  def artists_with_multiple_photographs
    photographs_by_artist.select do |artist, photo|
      return [artist.name] if photo.count > 1
    end
  end

  def photographs_taken_by_artist_from(country)
    photographs_by_artist.select do |artist, photo|
      photo if artist.country == country
    end 
  end
end
