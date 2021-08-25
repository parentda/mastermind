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

  def game_over?(guess)
    @code == guess
  end
end
