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
    song = self.new
    @@all << song
    song
  end

  def self.new_by_name(name)
    song = self.new
    song.name = name
    song
  end

  def self.create_by_name(name)
    song = self.new
    song.name = name
    @@all << song
    song
  end

  def self.find_by_name(name_finder)
    @@all.find{ |song| song.name == name_finder}
  end

  def self.find_or_create_by_name(name_finder)
    if self.find_by_name(name_finder) == nil
      self.create_by_name(name_finder)
    else
      self.find_by_name(name_finder)
    end
  end

  def self.alphabetical
    @@all.sort_by { |song| song.name }
  end

  def self.new_from_filename(filename)
    song = self.new
    file_array = filename.split(" - ")
    song.artist_name = file_array[0]
    song.name = file_array[1].split(".")[0]
    song
  end

  def self.create_from_filename(filename)
    song = self.new
    file_array = filename.split(" - ")
    song.artist_name = file_array[0]
    song.name = file_array[1].split(".")[0]
    @@all << song

  end

  def self.destroy_all
    @@all.clear
  end

end


# Song Class Methods
#   .create
#     instantiates and saves the song, and it returns the new song that was created (FAILED - 1)
#   .new_by_name
#     instantiates a song with a name property (FAILED - 2)
#   .create_by_name
#     instantiates and saves a song with a name property (FAILED - 3)
#   .find_by_name
#     can find a song present in @@all by name (FAILED - 4)
#     returns falsey when a song name is not present in @@all (FAILED - 5)
#   .find_or_create_by_name
#     invokes .find_by_name and .create_by_name instead of repeating code (FAILED - 6)
#     returns the existing Song object (doesn't create a new one) when provided the title of an existing Song (FAILED - 7)
#     creates a new Song object with the provided title if one doesn't already exist (FAILED - 8)
#   .alphabetical
#     returns all the song instances in alphabetical order by song name (FAILED - 9)
#   .new_from_filename
#     initializes a song and artist_name based on the filename format (FAILED - 10)
#   .create_from_filename
#     initializes and saves a song and artist_name based on the filename format (FAILED - 11)
#   .destroy_all
#     clears all the song instances from the @@all array (FAILED - 1
