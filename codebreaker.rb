# frozen_string_literal: true

class Codebreaker
  def initialize(player_type)
    @player_type = player_type
  end

  def human_guess_code
    gets.chomp.split('').map(&:to_i)
  end

  def computer_guess_code(code_pegs, code_length)
    possible_codes = code_pegs.repeated_permutation(code_length).to_a
  end
end
