require 'pry'
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
    song.save
    song
  end

  def self.new_by_name(song_name)
    song = self.new
    song.name = song_name
    song
  end

  def self.create_by_name(song_name)
    song = self.create
    song.name = song_name
    song
  end

  def self.find_by_name(song_name)
    self.all.find do |instance|
      instance.name == song_name
    end
  end

  def self.find_or_create_by_name(song_name)
    if self.find_by_name(song_name)
      self.find_by_name(song_name)
    else
      self.create_by_name(song_name)
    end
  end

  def self.alphabetical
    self.all.sort_by do |song|
      song.name
    end
  end

  def self.new_from_filename(file_name)
    split_by_period = file_name.split(".")
    split_by_period_then_hyphen = split_by_period[0].split("-")
    artist_song = split_by_period_then_hyphen.map do |element|
      element.lstrip.rstrip
    end
    artist_name = artist_song[0]
    song_name = artist_song[1]

    song = self.new
    song.name = song_name
    song.artist_name = artist_name
    song
  end

  def self.create_from_filename(file_name)
    split_by_period = file_name.split(".")
    split_by_period_then_hyphen = split_by_period[0].split("-")
    artist_song = split_by_period_then_hyphen.map do |element|
      element.lstrip.rstrip
    end
    artist_name = artist_song[0]
    song_name = artist_song[1]

    song = self.find_or_create_by_name(song_name)
    song.artist_name = artist_name
  end

  def self.destroy_all
    self.all.clear
  end

end
