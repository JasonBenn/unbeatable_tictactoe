require './tictactoe'

class RandomAI < Struct.new(:icon)
  def choose_next_move(board_string)
    TicTacToe.new(board_string).empty_spaces.sample
  end
end
