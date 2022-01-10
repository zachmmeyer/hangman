# frozen_string_literal: true

# Dictionary class
class Dictionary
  def initialize
    @dictionary = generate_dictionary_array('./dictionary.txt')
  end

  def generate_dictionary_array(dictionary)
    File.read(dictionary).split
  end
end
