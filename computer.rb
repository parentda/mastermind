# frozen_string_literal: true

class Computer
  def initialize
    @code_set = board.code_pegs.repeated_permutation(board.code_length).to_a
  end

  def make_code(board)
    Array.new(board.code_length) { board.code_pegs.sample }
  end

  def guess_code(board)
    sleep(1)
    possible_codes.sample
  end
end
