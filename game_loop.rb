require './tictactoe.rb'
require './players.rb'
require './view.rb'

class Game
	attr_accessor :game, :view, :player1, :player2

	def initialize(args)
		players = { human: Human, ai: AI }
		@game = args[:game] || TicTacToe.new
		@view = args[:view] || View
		@player1 = players[args[:player1]].new('X')
		@player2 = players[args[:player2]].new('O')
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

if $0 == __FILE__
	Game.new({
		player1: :ai,
		player2: :ai
		}).play
end
