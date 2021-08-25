# frozen_string_literal: true

class Board
  def initialize
    @guesses = {}
    @code_pegs = (1..8).to_a
    @code_length = 4
    @code = []
  end
end
