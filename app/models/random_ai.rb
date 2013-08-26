require_relative './player'
require_relative 'tic_tac_toe'

class RandomAI < Player
  def choose_next_move(board_string)
    TicTacToe.new(board_string).empty_cells.sample
  end
end
