# frozen_string_literal: true

# Computer class
class Computer
  attr_accessor :secret

  def initialize
    @secret = File.readlines('./dictionary.txt').sample
  end
end
