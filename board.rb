# frozen_string_literal: true

class Board
  attr_accessor :guesses, :code

  def initialize
    @guesses = {}
    @code_pegs = (1..8).to_a
    @code_length = 4
  end

  def update_guesses(turn, guess, key)
    guesses[turn] = [guess, key]
  end

  def valid_guess?(code)
    code.length == @code_length && code.all? { |num| @code_pegs.include?(num) }
  end

  def game_over?(guess)
    @code == guess
  end
end
