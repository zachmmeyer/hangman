# frozen_string_literal: true

# Dictionary class
class Dictionary
  attr_accessor :secret

  def initialize
    list = generate_dictionary_array('./dictionary.txt')
    @secret = choose_secret_word(list)
  end

  def generate_dictionary_array(dictionary)
    File.read(dictionary).split
  end

  def choose_secret_word(list)
    list.sample
  end
end
