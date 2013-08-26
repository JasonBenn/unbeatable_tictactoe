module InputValidator
  extend self
  def move_valid?(board_string, input)
    board_string[input] == '-'
  end
end
