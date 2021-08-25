# frozen_string_literal: true

module Displayable
  def human_guess_prompt(code_length, code_pegs)
    puts "Please enter #{code_length} numbers between #{code_pegs.first} & #{code_pegs.last} to guess the code:"
  end

  def human_guess_warning(code_length, code_pegs)
    puts "Sorry, that input was invalid. Please ensure your guess consists of #{code_length} numbers between #{code_pegs.first} & #{code_pegs.last}:"
  end
end
