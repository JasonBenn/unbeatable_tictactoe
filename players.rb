require './tictactoe'

class AI
	def self.next_move(board_string)
		9.times do |n|
			dup_string = board_string.split('')[n] = 'X'
			dup_game = TicTacToe.new(dup_string)
			return n if dup_game.winner?
		end
	end
end

test(
	AI.next_move('-XX------') == 0,
	)
puts 'passed!'
