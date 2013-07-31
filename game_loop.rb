require './counter'
require './tictactoe'
require './view'
require './human'
require './ai'
require './randomai'

class Game
	attr_accessor :game, :view, :player1, :player2

	def initialize(args)
		@game 	 = TicTacToe.new
		@view 	 = args[:view] 		|| View
		@player1 = args[:player1] || AI.new('X')
		@player2 = args[:player2] || RandomAI.new('O')
	end

	def play
		winner = nil
		[[player1, "X"], [player2, "O"]].cycle do |player, icon|
			break if winner = game.winner?
			input = player.choose_next_move(game.board)
			game.board[input] = icon
			view.show(game.board)
		end
		view.congratulate(winner)
	end
end

# if $0 == __FILE__
# 	Game.new({
# 		player1: :ai,
# 		player2: :human
# 		}).play
# end

counter = Counter.new
100.times do
	Game.new({
		view: counter
		}).play
end
p counter.winners
