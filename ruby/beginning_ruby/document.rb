class Document
  attr_accessor :title, :author, :content

  def initialize(title, author, content)
    @title = title
    @author = author
    @content = content
  end

  def words
    @content.split
  end

  def word_count
    words.size
  end
end

case title
when 'War and Peace'
  puts 'Tolstoy'
when 'Romeo and Juliet'
  puts 'Shakeshpeare'
else
  puts "Don't know"
end
