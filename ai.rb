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

		return 1 if danger_case?(game)

		cell = space_scores.max_by { |index, score| score }[0]
		orig_game.history << [symbol, cell]
		cell
	end

	def danger_case?(game)
		[ game.empty_spaces.count == 6,
			game.board[4] == symbol,
			opponent_has_opposite_corners(game.board)
			].all?
	end

	def opponent_has_opposite_corners(s)
		s[2] == other_symbol && s[6] == other_symbol || s[0] == other_symbol && s[8] == other_symbol
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

# If opponent's first move is a corner: you can NOT go in the middle.
# Guard against this case:
# 	Opp moves first: corner
# 	We move second: center
# 	They move third: opposite corner!
# 	DANGER CASE!  Don't choose other two corners!!
