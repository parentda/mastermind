# frozen_string_literal: true

class Codebreaker
  def initialize(player_type)
    @player_type = player_type
  end

  def human_guess_code
    gets.chomp.split('').map(&:to_i)
  end
end
