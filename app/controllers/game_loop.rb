class Game
  include MoveValidator
  attr_accessor :game, :board, :view, :player1, :player2

  def initialize(args = {})
    @game    = TicTacToe.new
    @board   = @game.board
    @view    = args[:view]     || View
    @player1 = (args[:player1] || Human).new('X')
    @player2 = (args[:player2] || AI).   new('O')
  end

  def play
    winner = nil
    view.show(board)
    [player1, player2].cycle do |player|
      break if winner = game.winner?

      cell = player.choose_next_move(board)
      until MoveValidator.move_valid?(board, cell)
        view.move_invalid
        cell = player.choose_next_move(board)
      end

      board[cell] = player.icon
      view.show(board)
    end
    view.congratulate(winner)
  end
end
