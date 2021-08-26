# frozen_string_literal: true
require_relative 'displayable'
require_relative 'board'
require_relative 'human'
require_relative 'computer'

class Game
  include Display
  attr_reader :turn

  def initialize
    @turn_number = 1
    @max_turns = 12
    @game_mode_options = %w[1 2]
  end

  def play_game(game_mode)
    @game_mode = game_mode
    setup
  end

  def setup
    @board = Board.new
    game_roles
  end

  def game_roles
    case @game_mode
    when @game_mode_options[0]
      @codebreaker = Human.new
      @codemaker = Computer.new
    when @game_mode_options[1]
      @codebreaker = Computer.new
      @codemaker = Human.new
    else
      puts 'Error, invalid selection'
    end
  end
end
