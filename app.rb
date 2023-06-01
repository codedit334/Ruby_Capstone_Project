require './Book/book'
require './Book/label'

require './data/preserve'

require_relative './music_classes/music'
require_relative './music_classes/genre'
require 'json'

class App
  def initialize
    @book = []
    @label = []
    @music = []
    @genre = []
    load_data
  end

  def list_all_books
    @book = load_data_from_path('./data/books.json')
    @label = load_data_from_path('./data/labels.json')
    if @book.empty?
      p 'There are no books'
      return
    end
    @book.each do |book|
      label = @label.find { |label_item| label_item['items'].include?(book) }
      puts "\n_____\n\n"
      puts "Publisher: #{book['publisher']}"
      puts "Cover State: #{book['cover_state']}"
      puts "Publish Date: #{book['publish_date']}"
      puts "Label: #{label['title']}" if label
      puts "\n_____\n"
    end
  end

  def list_all_labels
    @label = load_data_from_path('./data/labels.json')
    if @label.empty?
      puts 'There are no labels'
      return
    end
    @label.each_with_index do |label, index|
      puts "#{index + 1}) Title: #{label['title']}, Color: #{label['color']}"
    end
  end

  def create_book
    @book = load_data_from_path('./data/books.json')
    @label = load_data_from_path('./data/labels.json')

    print 'Enter book publisher:'
    publisher = gets.chomp

    print 'Enter book cover state:'
    cover_state = gets.chomp

    print 'Enter book publish date (YYYY-MM-DD):'
    publish_date = gets.chomp

    book = Book.new(publisher, cover_state, publish_date).to_h
    save_data_to_path(@book.push(book), './data/books.json')
    p 'Book created successfully'

    print "Do you want to add a label to #{publisher}'s book? (y/n)"
    answer = gets.chomp
    return unless %w[y Y].include?(answer)

    list_all_labels
    print 'Choose a label index:'

    label_index = gets.chomp.to_i - 1
    @label[label_index]['items'] << book

    save_data_to_path(@label, './data/labels.json')
    p 'Book added to label successfully'
  end

  def create_genre
    puts 'Enter genre:'
    genre = gets.chomp
    @genre << Genre.new(genre)
    save_data
  end

  def list_music_albums
    puts 'Music Albums:'
    puts @music
    @music.each do |album|
      puts "On Spotify: #{album.on_spotify ? 'Yes' : 'No'}"
      puts "Publication Date: #{album.publish_date}"
      puts "Title: #{album.name}"
    end
  end

  def list_genres
    puts 'Genres:'
    @genre.each do |genre|
      puts genre.name
    end
  end

  def add_music_album
    puts 'Is the music album available on Spotify? [y/n]'
    on_spotify = gets.chomp.downcase == 'y'

    puts 'Enter the title of the album:'
    name = gets.chomp

    puts 'Enter the publication date for the album (yyyy/mm/dd):'
    publish_date = gets.chomp

    album = MusicAlbum.new(on_spotify, publish_date, name)
    @music << album
    save_data

    puts 'Music album created successfully.'
  end

  def save_data
    File.write('music.json', JSON.generate(@music.map(&:to_h)))

    File.write('genre.json', JSON.generate(@genre.map(&:to_hash)))
  end

  def load_data
    if File.exist?('music.json')
      music_data = JSON.parse(File.read('music.json'))
      @music = if music_data.is_a?(Array)
                 music_data.map do |data|
                   MusicAlbum.new(data['on_spotify'], data['publish_date'],
                                  data['name'])
                 end
               else
                 []
               end
    end

    return unless File.exist?('genre.json')

    genre_data = JSON.parse(File.read('genre.json'))
    @genre = genre_data.is_a?(Array) ? genre_data.map { |data| Genre.new(data['name']) } : []
  end
end

app = App.new
# app.create_book
# app.list_all_books
# app.add_music_album
# app.list_music_albums
# app.list_genres
# app.create_genre
# app.list_music_albums
# app.list_genres
