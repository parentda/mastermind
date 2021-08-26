# frozen_string_literal: true
require_relative 'displayable'

class Human
  include Display

  def initialize; end

  def make_code(board)
    set_code_prompt(board.code_length, board.code_pegs)
    gets.chomp.split('').map(&:to_i)
  end

  def guess_code(board)
    guess_code_prompt(board.code_length, board.code_pegs)
    gets.chomp.split('').map(&:to_i)
  end
end
