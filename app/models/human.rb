require_relative './player'

class Human < Player

  def choose_next_move(board_string)
    $stdin.gets.to_i
  end
end

