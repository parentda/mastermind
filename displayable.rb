# frozen_string_literal: true

module Display
  def set_code_prompt(code_length, code_pegs)
    puts "Please enter #{code_length} numbers between #{code_pegs.first} & #{code_pegs.last} to set the code:"
  end

  def guess_code_prompt(code_length, code_pegs)
    puts "Please enter #{code_length} numbers between #{code_pegs.first} & #{code_pegs.last} to guess the code:"
  end

  def input_warning
    puts "\033[31mSorry, that input was invalid\033[0m"
  end

  def game_start_message
    puts 'Let the games begin'
  end

  def game_end_message
    puts 'Game Over!'
  end
end
