class TicTacToe
	attr_reader :board
	attr_accessor :history

	def initialize(board = '---------')
		@history = []
		@board = board
	end

	def winner?
		['X', 'O'].each do |player_symbol|
			sets_of_three.each do |set|
				actual = set.map { |cell| board[cell] }
				return player_symbol if actual == [player_symbol] * 3
			end
		end
		return 'D' unless board.include? '-'
		false
	end

	def empty_spaces
		9.times.select { |n| board[n] == '-' }
	end

	def sets_of_three
		[ [0, 1, 2],
			[3, 4, 5],
			[6, 7, 8],

			[0, 3, 6],
			[1, 4, 7],
			[2, 5, 8],

			[0, 4, 8],
			[2, 4, 6] ]
	end

	def relevant_sets_of_three(cell)
		sets_of_three.select { |set| set.include? cell }
	end

	def score(cell)
		score = 0
		relevant_sets_of_three(cell).map do |path|
			case path.map { |cell| board[cell] }.count('X')
			when 2 then score += 100
			when 1 then score += 10
			when 0 then score += 1
			end
		end
		score
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
