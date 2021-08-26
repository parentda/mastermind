# frozen_string_literal: true

class Board
  attr_accessor :guesses, :code, :code_length, :code_pegs

  def initialize
    @guesses = {}
    @code_pegs = (1..8).to_a
    @code_length = 4
  end

  def valid_code?(guess)
    guess.length == @code_length &&
      guess.all? { |num| @code_pegs.include?(num) }
  end

  def generate_hints(guess)
    hints = []
    num_exact_matches, guesses_filtered = exact_matches(guess)
    num_partial_matches = partial_matches(guesses_filtered)
    num_exact_matches.times { hints << 'R' }
    num_partial_matches.times { hints << 'W' }
    hints
  end

  def exact_matches(guess)
    num_matches = 0
    guess_filtered =
      @code
        .zip(guess)
        .reject { |pair| num_matches += 1 if pair.uniq.count == 1 }
        .transpose
        .map { |arr| arr.group_by { |i| i } }

    [num_matches, guess_filtered]
  end

  def partial_matches(guess_filtered)
    num_matches = 0
    guess_filtered[1].each do |key, value|
      next unless guess_filtered[0][key]

      num_matches +=
        if guess_filtered[0][key].length < value.length
          guess_filtered[0][key].length
        else
          value.length
        end
    end
    num_matches
  end

  def update_guesses(turn, guess, hints)
    guesses[turn] = [guess, hints]
  end

  def game_over?(guess)
    @code == guess
  end

  def draw_board
    @guesses.each do |turn, value|
      puts "Turn #{turn}   |   #{value[0].join(' ')}   |   #{value[1].join(' ')}"
    end
  end
end

board = Board.new
board.code = [1, 2, 4, 3]
hint1 = board.generate_hints([4, 1, 1, 3])
board.update_guesses(1, [4, 1, 1, 3], hint1)
hint2 = board.generate_hints([1, 2, 1, 3])
board.update_guesses(2, [1, 2, 1, 3], hint2)
board.draw_board
