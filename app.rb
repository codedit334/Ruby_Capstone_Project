require './Book/book'
require './Book/label'

class App
    def initialize
        @book = []
        @label = [Label.new("New", "yellow"), Label.new("Gift", "green")]
    end

    def list_all_books
        @book.each do |book|
            puts "Publisher: #{book.publisher}"
            puts "Cover State: #{book.cover_state}"
            puts "Publish Date: #{book.publish_date}"
        end
    end

    def list_all_labels
        @label.each_with_index do |label, index|
            puts "#{index + 1}) Title: #{label.title}, Color: #{label.color}"
        end
    end

    def create_book
        p 'Enter book publisher:'
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
        if(answer == 'y' || answer == 'Y')
            list_all_labels()

            p 'Choose a label index:'

            label_index = gets.chomp.to_i - 1
            @label[label_index].add_item(book)

            p 'Book added to label successfully'
        end

        p 'Thanks for using our app'
    end
end