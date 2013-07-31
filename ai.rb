require './tictactoe'

class AI < Struct.new(:symbol)

	def choose_next_move(board)
		game = TicTacToe.new(board)
		[symbol, other_symbol].each do |symbol|
			game.empty_spaces.each do |space|
				temp_board = board.dup
				temp_board[space] = symbol
				return space if TicTacToe.new(temp_board).winner?
			end
		end
		space_scores = game.empty_spaces.map do |space|
			[space, game.score(space)]
		end
		space_scores.max_by { |index, score| score }[0]
	end

	def other_symbol
		symbol == 'X' ? 'O' : 'X'
	end
end

if $0 == __FILE__
	require './test'
	ai = AI.new('X')
	Tester.test(
		ai.choose_next_move('XX-------') == 2,
		ai.choose_next_move('OO-------') == 2,
		ai.choose_next_move('OO-XX----') == 5,
		ai.choose_next_move('XOX------') == 4,
		)
end
