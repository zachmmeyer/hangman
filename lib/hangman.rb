# frozen_string_literal: true

module Hangman
  # Game class
  class Game
    def exit_game
      system('clear')
      puts 'Good-bye!'
      exit
    end

    def load_game
      system('clear')
      puts 'Load Game'
      # Save files (if any) are presented on screen
      # Player is able to select one of the listed save files
      # Once selected, all saved variables are loaded and the game is able to be played
    end

    def new_game
      system('clear')
      puts 'New Game'
      # Secret word is chosen at random
      # Player makes a guess by submitting a letter
      # Check is made to see if letter is part of Secret and has been found already
      # Player continues to make guesses until they figure out the Secret or run out of available Guesses
      # Player should be able to save current game
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
