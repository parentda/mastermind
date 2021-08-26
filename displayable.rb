# frozen_string_literal: true
require_relative 'string_extensions'

module Display
  def set_code_prompt(code_length, code_pegs)
    puts "\nPlease enter #{code_length} numbers between #{code_pegs.first} & #{code_pegs.last} to set the code:"
  end

  def guess_code_prompt(code_length, code_pegs)
    puts "\nPlease enter #{code_length} numbers between #{code_pegs.first} & #{code_pegs.last} to guess the code:"
  end

  def game_mode_message
    puts "Enter '1' to be the Codebreaker"
    puts "Enter '2' to be the Codemaker"
  end

  def input_warning
    puts 'Sorry, that input was invalid'.red
  end

  def game_start_message
    puts 'Let the games begin'
  end

  def game_end_message
    puts 'Game Over!'
  end
end
