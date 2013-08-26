require './app/models/tic_tac_toe'
require './app/views/view'
require './app/views/counter'
require './app/models/human'
require './app/models/ai'
require './app/models/random_ai'
require './app/helpers/move_validator'

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

if $0 == __FILE__
  if ARGV[0] == "test"
    counter = Counter.new
    ARGV[1].to_i.times do
      Game.new({
        view: counter,
        player1: RandomAI,
        player2: AI
        }).play
    end
    counter.display_results(ARGV[1])
  elsif ARGV[0] == "ai-first"
      Game.new({
        player1: AI,
        player2: Human
        }).play
  else
    Game.new.play
  end
end
