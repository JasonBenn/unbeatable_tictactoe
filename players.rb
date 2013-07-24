# AI determines the square with the highest probability of winning

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
	def self.calculate_probability(board_string)
		9.times.map do |space|
			board_string[space] == '-' ? 1 : 0
		end
	end

	def self.empty_spaces(board_string)
		9.times.select do |cell|
			board_string[cell] == '-'
		end
	end

end

test(
	AI.winning_move('-XX------') == 0,
 	AI.winning_move('--X-X----') == 6,
 	AI.winning_move('--X------') == false,
 	AI.empty_spaces('-XX--XX--') == [0, 3, 4, 7, 8],
 	AI.empty_spaces('---------') == (0..8).to_a,
 	AI.calculate_probability('XXXXXX---') == [0, 0, 0, 0, 0, 0, 1, 1, 1],
	)
puts 'passed!'
