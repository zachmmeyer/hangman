# frozen_string_literal: true

require_relative './computer'
require 'json'

module Hangman
  # Game class
  class Game
    def exit_game
      system('clear')
      exit
    end

    def load_game
      save_data = JSON.parse(JSON.parse(File.read('save.json')))
      @guesses = save_data[0]
      @computer = Computer.new
      @computer.load_saved_secret_word(save_data[1])
      @incorrectly_guessed_letters = save_data[2]
      @hidden_secret = save_data[3]
      @correctly_guessed_letters = save_data[4]
      hangman_round
    end

    def save_game
      save = [@guesses, @computer.secret_word, @incorrectly_guessed_letters, @hidden_secret, @correctly_guessed_letters]
      save_data = JSON.generate(save)
      File.write('save.json', JSON.dump(save_data))
      exit_game
    end

    def winner
      system('clear')
      puts 'Congratulations, Player!'
      puts 'You won!'
      puts "The word was: #{@computer.secret_word}"
      choose_game_mode
    end

    def loser
      system('clear')
      puts 'Condolenceses, Player!'
      puts 'You lost!'
      puts "The word was: #{@computer.secret_word}"
      choose_game_mode
    end

    def update_hidden_secret(guess, secret_word, correctly_guessed_letters)
      updated_hidden_secret = secret_word.chars.map do |char|
        if char == guess
          guess
        elsif correctly_guessed_letters.include?(char)
          char
        else
          '_'
        end
      end
      updated_hidden_secret.join('')
    end

    def check_for_end_game
      if @hidden_secret == @computer.secret_word
        winner
      elsif @guesses.zero?
        loser
      else
        hangman_round
      end
    end

    def check_player_input
      guess = gets.downcase.chomp
      save_game if guess == 'save'
      exit_game if guess == 'exit'
      if @computer.secret_word.include?(guess)
        if @correctly_guessed_letters.include?(guess) == false
          @hidden_secret = update_hidden_secret(guess, @computer.secret_word, @correctly_guessed_letters)
          @correctly_guessed_letters.push(guess)
        else
          hangman_round
        end
      elsif @incorrectly_guessed_letters.include?(guess)
        hangman_round
      else
        @incorrectly_guessed_letters.push(guess)
        @guesses -= 1
      end
    end

    def hangman_round
      system('clear')
      puts 'Hello Player!'
      puts "You have #{@guesses} guesses left"
      puts @hidden_secret
      puts "Incorrectly guessed letters: #{@incorrectly_guessed_letters}"
      puts 'Guess a letter: '
      check_player_input
      check_for_end_game
    end

    def generate_hidden_secret(secret_word)
      @hidden_secret = String.new('_') * secret_word.size
    end

    def new_game
      @computer = Computer.new
      @computer.generate_new_secret_word
      @correctly_guessed_letters = []
      @incorrectly_guessed_letters = []
      @guesses = 8
      generate_hidden_secret(@computer.secret_word)
      hangman_round
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
      puts 'Press 1 to start a new game of Hangman, Press 2 to load a saved game, or Press 3 to quit'
      player_choice = gets.chomp
      choice_case(player_choice)
    end

    def start_game
      system('clear')
      puts 'Welcome to Hangman!'
      choose_game_mode
    end
  end
end

Hangman::Game.new.start_game
