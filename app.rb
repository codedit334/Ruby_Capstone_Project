require './Book/book'
require './Book/label'
require_relative 'game/game_ui'

class App
  def initialize
    @book = []
    @label = [Label.new('New', 'yellow'), Label.new('Gift', 'green')]
    @game = GameUI.new
  end

  def list_all_books
    @book.each do |book|
      label = @label.find { |label| label.items.include?(book) }

      puts "Publisher: #{book.publisher}"
      puts "Cover State: #{book.cover_state}"
      puts "Publish Date: #{book.publish_date}"
      puts "Label: #{label.title}" if label
    end
  end

  def list_games
    @game.list_games
  end

  def list_authors
    @game.list_authors
  end

  def list_all_labels
    @label.each_with_index do |label, index|
      puts "#{index + 1}) Title: #{label.title}, Color: #{label.color}"
    end
  end

  def create_book
    puts 'Enter book publisher:'
    publisher = gets.chomp

    p 'Enter book cover state:'
    cover_state = gets.chomp

    p 'Enter book publish date (YYYY-MM-DD):'
    publish_date = gets.chomp

    book = Book.new(publisher, cover_state, publish_date)
    @book.push(book)

    p 'Book created successfully'

    p "Do you want to add a label to #{publisher}'s book? (y/n)"
    answer = gets.chomp
    if %w[y Y].include?(answer)
      list_all_labels

      p 'Choose a label index:'

      label_index = gets.chomp.to_i - 1
      @label[label_index].add_item(book)

      p 'Book added to label successfully'
    end

    p 'Thanks for using our app'
  end
end

app = App.new
app.list_all_labels
app.create_book
app.list_all_books
app.list_authors
app.list_games
