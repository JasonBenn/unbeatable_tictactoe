require './tictactoe.rb'

class Game
	attr_reader :game

	def initialize(board_string)
		@game = TicTacToe.new(board_string)
	end

	def show
		[game.board[0..2], game.board[3..5], game.board[6..8]]
	end
end

puts Game.new('---------').show
