require './Book/book'
require './Book/label'

class App
    def initialize
        @book = []
        @label = []
    end

    def create_book
        p 'Enter book publisher:'
        publisher = gets.chomp

        p 'Enter book cover state:'
        cover_state = gets.chomp

        p 'Enter book publish date (YYYY-MM-DD):'
        publish_date = gets.chomp

        @book.push(Book.new(publisher, cover_state, publish_date))
    end

    def list_all_books
        @book.each do |book|
            puts "Title: #{book.title}"
            puts "Publisher: #{book.publisher}"
        end
    end
end