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

    Enter '1' to be the CODBREAKER
    Enter '2' to be the CODEMAKER
    HEREDOC
  end

  def input_warning
    puts 'Sorry, that input was invalid'.red
  end

  def game_start_message
    puts <<~HEREDOC

    #{'-' * 100}

    Welcome to #{'MASTERMIND'.red.underline}!

    This is a one-player code-breaking game that is played against the computer


    #{'How To Play'.underline}

    You can choose one of two roles: CODBREAKER or CODEMAKER


    #{'CODEBREAKER'.underline}

    The computer will generate a four digit secret code using any permutation of the following eight keys (repeated keys are allowed):

    #{(1..8).map { |num| format(num) }.join(' ')}

    As the Codebreaker, you will have 12 turns to correctly guess the code
    
    After each guess, you will be provided feedback as to how accurate the guess was by a set of up to four tokens of the following variety:

      #{format('R')} - indicates that a key in the guess matches a key in the secret code in both position and value
      #{format('W')} - indicates that a key in the guess matches a key in the secret code in value only

    The game behaviour is illustrated in the following example:
    
      Secret Code 
      #{[3, 1, 6, 7].map { |num| format(num) }.join(' ')}

      Guess
      #{[6, 3, 4, 7].map { |num| format(num) }.join(' ')}  |  Clues - #{format('R')} #{format('W')} #{format('W')}
    
    
    #{'CODEMAKER'.underline}

    As the Codemaker, you simply have to create the four digit secret code from the eight keys listed above

    Then you can sit back and see if your code is able to stump the computer (Spoiler Alert: the computer is very good)


    The only thing left to do now is choose your role:
    HEREDOC
  end

  def game_end_message(game_mode, game_mode_options, game_over)
    case game_mode
    when game_mode_options[0]
      case game_over
      when true
        puts "\nCongratulations, you cracked the code! The computer was no match for you."
               .bold
      when false
        puts "\nYou lose. You were unable to solve the code in time."
      end
    when game_mode_options[1]
      case game_over
      when true
        puts "\nSorry, you've lost. The computer was able to guess your code."
      when false
        puts "\nYou win! You really bamboozled the computer with that code."
               .bold
      end
    end
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
