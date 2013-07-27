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

	def row
		board.split('').each_slice(3).map(&:join)
	end

	def column
		3.times.map do |n|
			board.split('').each_slice(3).map { |row| row[n] }.join
		end
	end

	def diagonal
		[[0, 4, 8], [2, 4, 6]].map do |diagonal|
			diagonal.map { |index| board[index] }.join
		end
	end
end

# TESTS

if $0 == __FILE__ || $0 == 'test.rb'
	require './test'

	def test_winner(board, winner)
		TicTacToe.new(board).winner? == winner
	end

	Tester.test(
		test_winner("XXX------", 'X'),
		test_winner("X--X--X--", 'X'),
		test_winner("O---O---O", 'O'),
		test_winner("--X-X-X--", 'X'),
		test_winner("X-X-X----", false),
		test_winner("XOXOXOOXO", 'D')
		)
	puts 'passed: tictactoe.rb!'
end
