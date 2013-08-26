require './app/models/tic_tac_toe'
require './app/views/view'
require './app/views/counter'
require './app/models/human'
require './app/models/ai'
require './app/models/random_ai'

class Game
  include InputValidator
  attr_accessor :game, :view, :player1, :player2

  def initialize(args = {})
    @game    = TicTacToe.new
    @view    = args[:view]     || View
    @player1 = (args[:player1] || Human).new('X')
    @player2 = (args[:player2] || AI).   new('O')
  end

  def play
    winner = nil
    view.show(game.board)
    [player1, player2].cycle do |player|
      break if winner = game.winner?

      cell = player.choose_next_move(game.board)
      until InputValidator.move_valid?(game.board, cell)
        view.move_invalid
        cell = player.choose_next_move(game.board)
      end

      game.board[cell] = player.icon
      view.show(game.board)
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
