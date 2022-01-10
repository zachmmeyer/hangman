# frozen_string_literal: true

# Dictionary class
class Dictionary
  def initialize
    list = generate_dictionary_array('./dictionary.txt')
  end

  def generate_dictionary_array(dictionary)
    File.read(dictionary).split
  end

  def choose_secret_word(list)
    list.sample
  end
end
