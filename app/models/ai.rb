require_relative './player'
require_relative 'tic_tac_toe'

class AI < Player
  attr_reader :game, :board

  def choose_next_move(board)
    @board = board
    @game = TicTacToe.new(board)
    return imminent_victor? if imminent_victor?
    return 1 if danger_case?
    highest_scoring_move
  end

  private

  def imminent_victor?
    [icon, other_icon].each do |icon|
      game.empty_cells.each do |cell|
        temp_board = board.dup
        temp_board[cell] = icon
        return cell if TicTacToe.new(temp_board).winner?
      end
    end
    false
  end

  def danger_case?
    [ game.empty_cells.count == 6,
      board[4] == icon,
      opponent_has_opposite_corners
      ].all?
  end

  def opponent_has_opposite_corners
    board[2] == other_icon && board[6] == other_icon || board[0] == other_icon && board[8] == other_icon
  end

  def highest_scoring_move
    cell_scores = game.empty_cells.map do |cell|
      [cell, game.score(cell)]
    end
    cell_scores.max_by { |index, score| score }[0]
  end

  def other_icon
    icon == 'X' ? 'O' : 'X'
  end
end
