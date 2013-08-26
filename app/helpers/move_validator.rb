module MoveValidator
  extend self
  def move_valid?(board_string, move)
    board_string[move] == '-'
  end
end
