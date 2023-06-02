require './app'
require './game/game_ui'

class Main
  def options
    puts 'Please choose an option by entering a member: '
    puts '1. ~ List all books'
    puts '2. ~ List all music albums'
    puts '3. ~ List of games'
    puts '4. ~ List all genres'
    puts '5. ~ List all labels'
    puts '6. ~ List all authors'
    puts '7. ~ Add a book'
    puts '8. ~ Add a music album'
    puts '9. ~ Add a game'
    puts '10. ~ exit'
  end

  def choose_option
    app = App.new
    game = GameUI.new
    option = gets.chomp

    case option
    when '1' then app.list_all_books
    when '2' then app.list_music_albums
    when '3' then game.list_games
    when '4' then app.list_genres
    when '5' then app.list_all_labels
    when '6' then game.list_authors
    when '7' then app.create_book
    when '8' then app.add_music_album
    when '9' then game.add_game
    else exit_app
    end
  end

  def exit_app
    puts 'Thank you for using this app!'
    exit
  end

  def execute_app
    puts 'Welcome!'

    loop do
      options
      choose_option
    end
  end
end

def main
  execute_main = Main.new
  execute_main.execute_app
end

main
