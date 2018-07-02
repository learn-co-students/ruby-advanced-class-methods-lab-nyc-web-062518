require "pry"

class Song

  @@all = []

  attr_accessor :name, :artist_name

  def self.all
    @@all
  end

  # instantiates and saves the song, and it returns the new song that was created
  def self.create
    song = self.new
    @@all << song
    song
  end

  # instantiates a song with a name property
  def self.new_by_name(name)
    song = self.new
    song.name = name
    song
  end

  # instantiates and saves a song with a name property
  def self.create_by_name(name)
    song = self.new_by_name(name)
    @@all << song
    song
  end

  # can find a song present in @@all by name
  # returns falsey when a song name is not present in @@all
  def self.find_by_name(name)
    self.all.find do |song|
      song.name == name
    end
  end

  # invokes .find_by_name and .create_by_name instead of repeating code
  # returns the existing Song object (doesn\'t create a new one) when provided the title of an existing Song
  # creates a new Song object with the provided title if one doesn't already exist
  def self.find_or_create_by_name(song_name)
    song = self.find_by_name(song_name)
    if song
      song
    else
      self.create_by_name(song_name)
    end
  end

  # returns all the song instances in alphabetical order by song name
  def self.alphabetical
    new_array = self.all.sort_by do |song|
      song.name
    end
    new_array
  end

  # initializes a song and artist_name based on the filename format
  # "Thundercat - For Love I Come.mp3"
  def self.new_from_filename(name)
    name.chomp!(".mp3")
    shortened_name = name.split(" - ")
    artist_name = shortened_name[0]
    name = shortened_name[1]
    new_song = self.new
    new_song.name = name
    new_song.artist_name = artist_name
    #
    # @@all << new_song
    new_song
  end

  # initializes and saves a song and artist_name based on the filename format
  def self.create_from_filename(name)
    new_song = self.new_from_filename(name)
    @@all << new_song
    new_song
  end

  def self.destroy_all
    self.all.clear
  end

end
