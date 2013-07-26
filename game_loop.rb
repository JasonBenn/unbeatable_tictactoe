require './tictactoe.rb'
require './players.rb'
require './view.rb'

class Game
	attr_accessor :game, :view, :player1, :player2

	def initialize(args)
		@game = args[:game] || TicTacToe.new
		@view = args[:view] || View
		@player1 = args[:player1]
		@player2 = args[:player2]

		play
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

Game.new({
	player1: AI.new,
	player2: AI.new
	})

