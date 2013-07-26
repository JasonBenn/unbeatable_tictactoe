require './tictactoe.rb'
require './view.rb'

class Game
	attr_accessor :game, :view

	def initialize(game = TicTacToe.new, view = View.new)
		@game = game
		@view = view
		play
	end

	def play
		until winner = game.winner?
			input = gets.chomp.to_i
			game.board[input] = 'X'
			view.show(game.board)
		end
		view.congratulate(winner)
	end
end

Game.new
