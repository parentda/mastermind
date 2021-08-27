# frozen_string_literal: true
require_relative 'displayable'
require_relative 'board'
require_relative 'human'
require_relative 'computer'

class Game
  include Display

  def initialize
    @game_over = false
    @turn_number = 1
    @max_turns = 12
    @game_mode_options = %w[1 2]
  end

  def play
    game_start_message
    setup
    create_code
    play_turn until @game_over || @turn_number > @max_turns
    game_end_message
  end

  def setup
    input_game_mode
    @board = Board.new
    game_roles
  end

  def create_code
    while (code = @codemaker.make_code(@board))
      break @board.code = code if @board.valid_code?(code)

      input_warning
    end
  end

  def input_guess
    while (code = @codebreaker.guess_code(@board))
      return code if @board.valid_code?(code)

      input_warning
    end
  end

  def input_game_mode
    game_mode_message
    while (@game_mode = gets.chomp)
      break if @game_mode_options.include?(@game_mode)

      input_warning
    end
  end

  def play_turn
    guess = input_guess
    hints = @board.generate_hints(guess, @board.code)
    @board.update_guesses(@turn_number, guess, hints)
    display_board(@board)
    @game_over = @board.game_over?(guess)
    @turn_number += 1
  end

  def game_roles
    case @game_mode
    when @game_mode_options[0]
      @codemaker = Computer.new
      @codebreaker = Human.new
    when @game_mode_options[1]
      @codemaker = Human.new
      @codebreaker = Computer.new
      @codebreaker.generate_code_set(@board)
    end
  end
end
