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
    new_song = self.new
    self.all << new_song
    new_song
  end

  def self.new_by_name(title)
    song = self.new
    song.name = title
    return song
  end

  def self.create_by_name(title)
    song = Song.new
    song.name = title
    @@all << song
    return song
  end

  def self.find_by_name(title)
    self.all.find {|tune| tune.name == title}
  end

  def self.find_or_create_by_name(name)
    if find_by_name(name)
      find_by_name(name)
    else
      self.create_by_name(name)
    end
  end

  def self.new_from_filename(filename)
    song = Song.new
    file_array = filename.split(" - ")
    song.artist_name = file_array[0]
    song.name = file_array[1].chomp(".mp3")
    song
    #binding.pry
  end

  def self.create_from_filename(filename)
    song = new_from_filename(filename)
    @@all << song
  end

  def self.alphabetical
   self.all.sort_by {|song| song.name[0]}
  end

  def self.destroy_all
    @@all.clear
  end


end
