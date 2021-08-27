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
    puts <<~HEREDOC
    Enter '1' to be the Codebreaker
    Enter '2' to be the Codemaker
    HEREDOC
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

  def display_board(board)
    guesses = board.guesses
    puts <<~HEREDOC

    Guess ##{guesses.keys.last}
    #{guesses[guesses.keys.last][0].map { |key| format(key) }.join(' ')}   |   Clues: #{guesses[guesses.keys.last][1].map { |key| format(key) }.join(' ')}
    HEREDOC
  end

  def format(char)
    case char
    when 1
      "  #{char}  ".bold.white.bg_black
    when 2
      "  #{char}  ".bold.white.bg_red
    when 3
      "  #{char}  ".bold.white.bg_green
    when 4
      "  #{char}  ".bold.white.bg_yellow
    when 5
      "  #{char}  ".bold.white.bg_blue
    when 6
      "  #{char}  ".bold.white.bg_magenta
    when 7
      "  #{char}  ".bold.white.bg_cyan
    when 8
      "  #{char}  ".bold.black.bg_white
    when 'R'
      "\u25CF".red
    when 'W'
      "\u25CF".white
    end
  end
end
