require './tictactoe'

class AI < Struct.new(:icon)
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
      game.empty_spaces.each do |space|
        temp_board = board.dup
        temp_board[space] = icon
        return space if TicTacToe.new(temp_board).winner?
      end
    end
    false
  end

  def danger_case?
    [ game.empty_spaces.count == 6,
      board[4] == icon,
      opponent_has_opposite_corners
      ].all?
  end

  def opponent_has_opposite_corners
    board[2] == other_icon && board[6] == other_icon || board[0] == other_icon && board[8] == other_icon
  end

  def highest_scoring_move
    space_scores = game.empty_spaces.map do |space|
      [space, game.score(space)]
    end
    space_scores.max_by { |index, score| score }[0]
  end

  def other_icon
    icon == 'X' ? 'O' : 'X'
  end
end

if $0 == __FILE__
  require './test'
  ai = AI.new('X')
  Tester.test(
    ai.choose_next_move('XX-------') == 2,
    ai.choose_next_move('OO-------') == 2,
    ai.choose_next_move('OO-XX----') == 5,
    ai.choose_next_move('XOX------') == 4,
    )
end
