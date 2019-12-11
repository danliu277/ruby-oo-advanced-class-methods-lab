class Song
  attr_accessor :name, :artist_name
  @@all = []

  def self.all
    @@all
  end

  def save
    self.class.all << self
  end

  def self.create
    song = Song.new
    @@all.push(song)
    return song
  end

  def self.new_by_name(name)
    song = Song.new
    song.name = name
    return song
  end

  def self.create_by_name(name)
    song = Song.new
    song.name = name
    @@all.push(song)
    return song
  end

  def self.find_by_name(name)
    @@all.find{|x| x.name == name}
  end

  def self.find_or_create_by_name(name)
    song = self.find_by_name(name)
    if !song
      song = self.create_by_name(name)
    end
    return song
  end

  def self.alphabetical
    @@all.sort_by{|x| x.name}
  end

  def self.new_from_filename(name)
    file = name.split(" - ")
    file[1] = file[1][0, file[1].index(".")]
    song = Song.new
    song.name = file[1]
    song.artist_name = file[0]
    return song
  end

  def self.create_from_filename(name)
    song = self.new_from_filename(name)
    @@all.push(song)
    return song
  end

  def self.destroy_all
    @@all = []
  end

end
