require "pry"

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

  def self.new_by_name(song_name)
    new_song = self.new
    new_song.name = song_name
    new_song
  end

  def self.create_by_name(song_name)
    new_song = new_by_name(song_name)
    self.all << new_song
    new_song
  end

  def self.find_by_name(song_name)
    self.all.find {|song| song.name == song_name}
  end

  def self.find_or_create_by_name(song_name)
    song = self.find_by_name(song_name)
    if song
      song
    else
      self.create_by_name(song_name)
    end
  end

  def self.new_from_filename(file_name)
    file_name.chomp!(".mp3")
    split_file_name = file_name.split(" - ")
    artist_name = split_file_name[0]
    song_name = split_file_name[1]
    new_song = Song.new
    new_song.artist_name = artist_name
    new_song.name = song_name
    new_song
  end

  def self.create_from_filename(file_name)
    new_song_from_filename = self.new_from_filename(file_name)
    self.all << new_song_from_filename
  end

  def self.alphabetical
    self.all.sort_by {|song| song.name}
  end

  def self.destroy_all
    self.all.clear
  end

end
