class Computer
  def initialize; end

  def make_code(code_length, code_pegs)
    Array.new(code_length) { code_pegs.sample }
  end

  def guess_code(code_pegs, code_length)
    possible_codes = code_pegs.repeated_permutation(code_length).to_a
  end
end
