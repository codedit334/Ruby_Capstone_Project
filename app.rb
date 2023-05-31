require './Book/book'
require './Book/label'

require './data/preserve'

class App
  def initialize
    @book = []
    @label = []
  end

  def list_all_books
    @book = load_data('./data/books.json')
    @label = load_data('./data/labels.json')
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
    @label = load_data('./data/labels.json')
    @label.each_with_index do |label, index|
      puts "#{index + 1}) Title: #{label['title']}, Color: #{label['color']}"
    end
  end

  def create_book
    @book = load_data('./data/books.json')
    @label = load_data('./data/labels.json')

    print 'Enter book publisher:'
    publisher = gets.chomp

    print 'Enter book cover state:'
    cover_state = gets.chomp

    print 'Enter book publish date (YYYY-MM-DD):'
    publish_date = gets.chomp

    book = Book.new(publisher, cover_state, publish_date).to_h
    save_data(@book.push(book), './data/books.json')
    p 'Book created successfully'

    print "Do you want to add a label to #{publisher}'s book? (y/n)"
    answer = gets.chomp
    return unless %w[y Y].include?(answer)

    list_all_labels
    print 'Choose a label index:'

    label_index = gets.chomp.to_i - 1
    @label[label_index]['items'] << book

    save_data(@label, './data/labels.json')
    p 'Book added to label successfully'
  end
end

app = App.new
app.create_book
app.list_all_books
