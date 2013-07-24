require './tictactoe'

class AI
	def self.winning_move(board_string)
		9.times do |n|
			dup_board = board_string.dup
			dup_board[n] = 'X'
			return n if TicTacToe.new(dup_board).winner?
		end
		false
	end
end

test(
	AI.winning_move('-XX------') == 0,
 	AI.winning_move('--X-X----') == 6,
 	AI.winning_move('--X------') == false
	)
puts 'passed!'
