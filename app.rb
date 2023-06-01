require_relative './music_classes/music'
require_relative './music_classes/genre'
require 'json'

class App
  def initialize
    @music = []
    @genre = []
    load_data
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
# app.add_music_album
app.list_music_albums
# app.list_genres
# app.create_genre
# app.list_music_albums
# app.list_genres
