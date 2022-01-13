# frozen_string_literal: true

# Computer class
class Computer
  attr_accessor :secret_word

  def generate_new_secret_word
    @secret_word = File.readlines('./dictionary.txt').sample.downcase.chomp
  end

  def load_saved_secret_word(loaded_word)
    @secret_word = loaded_word
  end
end
