class Song
    attr_reader :name, :artist, :duration
  
    def initialize(name, artist, duration)
      @name = name
      @artist = artist
      @duration = duration
    end
  
    def play
      puts "Playing '#{name}' by #{artist} (#{duration} mins)..."
    end
  end

  class Playlist
    include MyEnumerable

    def initialize(name)
      @name = name
      @songs = []
    end
  
    def add_song(song)
      @songs << song
    end
    
    # def each
    #     @songs.each do |song|
    #     puts "Yielding #{song.name}..."
    #     yield song
    #   end
    # end

    def play_songs
        each { |song| song.play }
    end

    def each_tagline
        @songs.each { |song| yield "#{song.name} - #{song.artist}" }
    end

    def each_by_artist(artist)
        select { |song| song.artist == artist }.each { |song| yield song }
    end
    
  end

song1 = Song.new('Thriller','Michael Jackson', 5)
song2 = Song.new('Bad Habits','Ed Sheeran', 5)
song2 = Song.new('i see fire','Ed Sheeran', 5)
song2 = Song.new('nog eentje','Ed Sheeran', 5)
song3 = Song.new('Snow','Red hot chili pepper', 6)
myplaylist = Playlist.new("My favourites")
myplaylist.add_song(song1)
myplaylist.add_song(song2)
myplaylist.add_song(song3)

myplaylist.play_songs

puts myplaylist.each_by_artist("Ed Sheeran")  { |song| song.play }
