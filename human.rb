# frozen_string_literal: true

class Human
  def initialize; end

  def make_code
    gets.chomp.split('').map(&:to_i)
  end

  alias guess_code make_code
end
