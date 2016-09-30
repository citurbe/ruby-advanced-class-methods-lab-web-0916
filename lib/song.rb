class Song
  attr_accessor :name, :artist_name
  @@all = []

  def self.create
  	song = self.new
  	self.all << song
  	song
  end

  def self.new_by_name(song_name)
  	song = self.new
  	song.name = song_name
 
  	song
  end

   def self.create_by_name(song_name)
  	song = self.new_by_name(song_name)
  	self.all << song
  	song
  end

  def self.find_by_name(song_name)
  	self.all.find {|song| song.name == song_name}
  end

  def self.find_or_create_by_name(song_name)
  	if self.all.include?(song_name)
  		self.find_by_name(song_name)
  	else
  		self.create_by_name(song_name)
  	end
  end

  def self.alphabetical
  	self.all.sort_by {|song| song.name}
  end

  def self.new_from_filename(filename)
  	artist_title = filename.chomp!(".mp3").split(" - ")
  	song = self.new
  	song.name = artist_title[1]
  	song.artist_name = artist_title[0]

  	song
  end

  def self.create_from_filename(filename)
  	song = self.new_from_filename(filename)
  	self.all << song
  end

  def self.destroy_all
  	@@all = []
  end

  def self.all
    @@all
  end

  def save
    self.class.all << self
  end

end
