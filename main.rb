# frozen_string_literal: true
require_relative 'game'

def game_restart
  puts "\nWould you like to play again? Enter (Y/y) to start a new game or any other key to quit:"
  gets.chomp.downcase == 'y'
end

def game_end
  puts "\nThanks for playing!"
end

loop do
  game = Game.new
  game.play
  break game_end unless game_restart
end
