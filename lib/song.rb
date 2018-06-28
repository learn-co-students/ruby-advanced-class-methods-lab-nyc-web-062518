class Song
  attr_accessor :name, :artist_name
  @@all = []

  def self.create
    song = self.new
    @@all << song
    song
  end

  def self.new_by_name(song_name)
    new_song = self.create
    new_song.name = song_name
    new_song
  end

  def self.create_by_name(song_name)
    new_song = self.create
    new_song.name = song_name
    @@all << new_song
    new_song
  end

  def self.find_by_name(song_name)
    @@all.find{|song_instance| song_instance.name == song_name}
  end

  def self.find_or_create_by_name(song_name)
    exists = self.find_by_name(song_name)
    if exists
      exists
    else
      self.create_by_name(song_name)
    end
  end

  def self.alphabetical
    (self.all).sort_by{|song_instance| song_instance.name.downcase}.uniq
  end

  def self.new_from_filename(mp3_file)
    files = mp3_file.split(" - ")
    files[1] = files[1].chomp(".mp3")
    new_song = self.create
    new_song.name = files[1]
    new_song.artist_name = files[0]
    new_song
  end

  def self.create_from_filename(mp3_file)
    files = mp3_file.split(" - ")
    files[1] = files[1].chomp(".mp3")
    new_song = self.create
    new_song.name = files[1]
    new_song.artist_name = files[0]
    @@all << new_song
    new_song
  end

  def self.destroy_all
    @@all.clear
  end

  def self.all
    @@all
  end

  def save
    self.class.all << self
  end

end
