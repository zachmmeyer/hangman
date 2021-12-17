# frozen_string_literal: true

module Hangman
  # Game class
  class Game
    def start_game
      puts 'Welcome to Hangman!'
      puts 'Press 1 to start a new game of Hangman, Press 2 to load a saved game, or Press 3 to quit'
    end
  end
end

Hangman::Game.new.start_game
