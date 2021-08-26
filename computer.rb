# frozen_string_literal: true

class Computer
  def initialize
    @code_set = []
  end

  def make_code(board)
    Array.new(board.code_length) { board.code_pegs.sample }
  end

  def guess_code(board)
    sleep(1)
    return @initial_guess if board.guesses.empty?

    reduce_code_set(board)
    @code_set.sample
  end

  def generate_code_set(board)
    @code_set = board.code_pegs.repeated_permutation(board.code_length).to_a
    @initial_guess = @code_set.sample
  end

  def reduce_code_set(board)
    prev_guess = board.guesses[board.guesses.keys.last][0]
    prev_hints = board.guesses[board.guesses.keys.last][1]
    @code_set.keep_if do |possible_guess|
      prev_hints == board.generate_hints(possible_guess, prev_guess)
    end
  end
end
