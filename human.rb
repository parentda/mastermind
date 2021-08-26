class Human
  def initialize; end

  def input_code
    gets.chomp.split('').map(&:to_i)
  end
end
