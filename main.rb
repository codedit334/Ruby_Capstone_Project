# require './app'
class Main
  def options
    puts 'Please choose an option by entering a member: '
    puts '1. ~ List all books'
    puts '2. ~ List all music albums'
    puts '3. ~ List all movies'
    puts '4. ~ List of games'
    puts '5. ~ List all genres'
    puts '6. ~ List all labels'
    puts '7. ~ List all authors'
    puts '8. ~ List all sources'
    puts '9. ~ Add a book'
    puts '10. ~ Add a music album'
    puts '11. ~ Add a movie'
    puts '12. ~ Add a game'
    puts '13. ~ exit'
  end

  def execute_app
    puts 'Welcome!'

    loop do
      options
      option = gets.chomp

      break if option == '13'
    end
  end
end

def main
  execute_main = Main.new
  execute_main.execute_app
end

main
