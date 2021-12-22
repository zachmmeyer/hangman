# frozen_string_literal: true

module Hangman
  # Game class
  class Game
    def initialize
      @dictionary = generate_dictionary_array('./dictionary.txt')
    end

    # Maybe the dictionary should be it's own class?

    def generate_dictionary_array(dictionary)
      File.read(dictionary).split
    end

    def exit_game
      puts 'Good-bye!'
      exit
    end

    def load_game
      puts 'Load Game'
    end

    def new_game
      puts 'New Game'
    end

    def choice_case(player_choice)
      case player_choice
      when '1'
        new_game
      when '2'
        load_game
      when '3'
        exit_game
      else
        start_game
      end
    end

    def choose_game_mode
      player_choice = gets.chomp
      choice_case(player_choice)
    end

    def start_game
      system('clear')
      puts 'Welcome to Hangman!'
      puts 'Press 1 to start a new game of Hangman, Press 2 to load a saved game, or Press 3 to quit'
      choose_game_mode
    end
  end
end

Hangman::Game.new.start_game
