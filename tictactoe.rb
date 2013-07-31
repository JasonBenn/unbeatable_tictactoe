# Determine if a board string has a winner

# IMPLEMENTATION

class TicTacToe
	attr_reader :board
	def initialize(board = '---------')
		@board = board
	end

	def winner?
		['X', 'O'].each do |player|
			[row, column, diagonal].each do |route|
				return player if route.include?(player*3)
			end
		end
		return 'D' unless board.include? '-'
		false
	end

	end

	def sets_of_three
		[
			[0, 1, 2],
			[3, 4, 5],
			[6, 7, 8],

			[0, 3, 6],
			[1, 4, 7],
			[2, 5, 8],

			[0, 4, 8],
			[2, 4, 6]
		]
	end

	end

		end
	end
end

# TESTS

if $0 == __FILE__
	require './test'

	def test_winner(board, winner)
		TicTacToe.new(board).winner? == winner
	end

	puts TicTacToe.new('------X-X').score(7)

	Tester.test(
		test_winner("XXX------", 'X'),
		test_winner("X--X--X--", 'X'),
		test_winner("O---O---O", 'O'),
		test_winner("--X-X-X--", 'X'),
		test_winner("X-X-X----", false),
		test_winner("XOXOXOOXO", 'D'),
		TicTacToe.new('---------').empty_spaces == (0..8).to_a,
		TicTacToe.new('--------X').empty_spaces == (0..7).to_a
		)
end
