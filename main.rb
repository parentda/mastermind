# frozen_string_literal: true

require_relative 'board'
require_relative 'game'
require_relative 'human'
require_relative 'computer'
require_relative 'displayable'

def game_restart
  puts "\nWould you like to play again? Enter (Y/y) to start a new game or any other key to quit:"
  gets.chomp.downcase == 'y'
end

loop do
  game = Game.new
  game.play
  break unless game_restart
end
