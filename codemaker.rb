# frozen_string_literal: true

class Codemaker
  def initialize(player_type)
    @player_type = player_type
  end

  def computer_make_code(code_pegs, code_length)
    Array.new(code_length) { code_pegs.sample }
  end
end
