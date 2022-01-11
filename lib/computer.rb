# frozen_string_literal: true

# Computer class
class Computer
  attr_accessor :secret_word

  def generate_new_secret_word
    @secret_word = File.readlines('./dictionary.txt').sample.downcase
  end

  def initialize
    @secret = File.readlines('./dictionary.txt').sample
  end
end
