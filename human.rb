# frozen_string_literal: true
require_relative 'displayable'

class Human
  include Display

  def initialize; end

  def make_code(code_length, code_pegs)
    set_code_prompt(code_length, code_pegs)
    gets.chomp.split('').map(&:to_i)
  end

  def guess_code(code_length, code_pegs)
    guess_code_prompt(code_length, code_pegs)
    gets.chomp.split('').map(&:to_i)
  end
end
