require_relative 'tic_tac_toe'

class RandomAI < Struct.new(:icon)
  def choose_next_move(board_string)
    TicTacToe.new(board_string).empty_cells.sample
  end
end
