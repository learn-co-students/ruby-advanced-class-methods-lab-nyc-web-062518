class Song
  attr_accessor :name, :artist_name
  @@all = []

  def self.all
    @@all
  end

  def save
    self.class.all << self
  end

  def self.create # instantiates, saves song & returns song
    song = self.new
    @@all << song
    song
  end

  def self.new_by_name(songName) # accepts a string songName & instantiates a song with a name property
    song = self.new
    song.name = songName
    song
  end

  def self.create_by_name(songName) # accepts a string songName, instantiates & saves a song with a name property
    song = self.new
    song.name = songName
    @@all << song
    song
  end

  def self.find_by_name(songName) # accepts a string songName
    songArray = @@all.select do |song| # can find a song present in @@all by name
      song.name == songName
    end
    if songArray.length > 0
      songArray.fetch(0)
    else
      nil #returns falsey when a song name is not present in @@all
    end
  end

  def self.find_or_create_by_name(songName) # accepts a string songName;
    #invokes .find_by_name & .create_by_name instead of repeating code
    methodFind = self.find_by_name(songName)
    methodCreate = self.create_by_name(songName)
    if methodFind != nil
      methodFind # returns the existing Song object when provided the title of an existing Song
    else
      methodCreate # creates a new Song object with the provided title if one doesn't already exist
    end
  end

  def self.alphabetical # returns all the song instances in alphabetical order by song name
    @@all.sort_by do |song|
      song.name
    end
  end

  def self.new_from_filename(fileName) # accepts string fileName
    parsedFilename = fileName.split(" - ")
    artistName = parsedFilename[0]
    songName = ((parsedFilename[1]).split(".mp3"))[0]
    song = self.new # initializes a song & artist_name based on the filename format
    song.name = songName
    song.artist_name = artistName
    song
  end

  def self.create_from_filename(fileName) # initializes & saves a song & artist_name based on the filename format
    @@all << self.new_from_filename(fileName)
  end

  def self.destroy_all # clears all the song instances from the @@all array
    @@all = []
  end

end
