require "pry"

class Artist
    attr_reader :name

    @@all = []

    def initialize(name)
        @name = name
        self.class.all << self
    end

    def self.all
        @@all
    end

    def new_song(name, genre)
        song = Song.new(name, self, genre)
        song.artist = self
        song
    end

    def songs
        Song.all.select do |song|
            song.artist == self
        end
    end

    def genres
        songs.map do |song|
            song.genre
        end
    end

end
