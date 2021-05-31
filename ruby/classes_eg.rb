class Square
    def initialize(side_length)
        @side_length = side_length
        if defined?(@@number_of_squares)
            @@number_of_squares += 1
        else
            @@number_of_squares = 1
        end
    end

    def area
        @side_length ** 2
    end

    def self.count
        @@number_of_squares
    end
end

class Person
    def initialize(name)
        set_name(name)
    end

    def name
        @first_name + ' ' + @last_name
    end

    private

    def set_name(name)
        first_name, last_name = name.split(/\s+/)
        set_first_name(first_name)
        set_last_name(last_name)
    end

    def set_first_name(name)
        @first_name = name
    end

    def set_last_name(name)
        @last_name = name
    end
end

class Drawing
    def Drawing.give_me_a_circle
        Circle.new
    end

    class Line
    end

    class Circle
        def what_am_i
            "This is a circle"
        end
    end
end

module UsefulFeatures
    def class_name
        self.class.to_s
    end
end

class Guy
    include UsefulFeatures
end

class AllVowels
    include Enumerable

    @@vowels = %w{a e i o u}
    def each
        @@vowels.each { |v| yield v }
    end
end

class Song
    include Comparable

    attr_accessor :length
    def <=>(other)
        @length <=> other.length
    end

    def initialize(song_name, length)
        @song_name = song_name
        @length = length
    end

end

a = Song.new("Rock around the clock", 143)
b = Song.new('Bohemian Rhapsody', 544)
c = Song.new('Minute Waltz', 60)

