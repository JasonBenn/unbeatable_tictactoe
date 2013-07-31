require './tictactoe'

class AI < Struct.new(:symbol)

	def choose_next_move(orig_game)
		game = TicTacToe.new(orig_game.board)
		[symbol, other_symbol].each do |player_symbol|
			game.empty_spaces.each do |space|
				temp_board = game.board.dup
				temp_board[space] = player_symbol
				if TicTacToe.new(temp_board).winner?
					orig_game.history << [symbol, space]
					return space
				end
			end
		end

		space_scores = game.empty_spaces.map do |space|
			[space, game.score(space)]
		end
		cell = space_scores.max_by { |index, score| score }[0]
		orig_game.history << [symbol, cell]
		cell
	end

	def other_symbol
		symbol == 'X' ? 'O' : 'X'
	end
end

if $0 == __FILE__
	require './test'
	ai = AI.new('X')

puts ai.choose_next_move(TicTacToe.new('X-OOO-X-X'))

	# Tester.test(
	# 	ai.choose_next_move('XX-------') == 2,
	# 	ai.choose_next_move('OO-------') == 2,
	# 	ai.choose_next_move('OO-XX----') == 5,
	# 	ai.choose_next_move('XOX------') == 4,
	# 	)
end

# If opponent's first move is a corner: you can NOT go in the middle.
