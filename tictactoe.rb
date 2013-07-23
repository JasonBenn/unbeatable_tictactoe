# IMPLEMENTATION

class TicTacToe
	attr_reader :board
	def initialize(board)
		@board = board.insert(6, "\n").insert(3, "\n")
	end

	def winner?
		['X', 'O'].each do |player|
			[row, column, diagonal].each do |route|
				return player if route.include?(player*3)
			end
		end
	end

	def row
		board.each_line.map(&:chomp)
	end

	def column
		3.times.map do |n|
			board.each_line.map { |row| row[n] }.join
		end
	end

	def diagonal
		[[0, 5, 10], [2, 5, 8]].map do |diagonal|
			diagonal.map { |index| board[index] }.join
		end
	end
end

# TEST HARNESS

def test_winner(board, winner)
	TicTacToe.new(board).winner? == winner
end

def test(*bools)
	bools.each_with_index do |result, i|
		unless result
			puts "Test ##{i+1} failed!"
			abort
		end
	end
end

# TESTS

if $0 == __FILE__
	test(
		test_winner("XXX------", 'X'),
		test_winner("---OOO---", 'O'),
		test_winner("X--X--X--", 'X'),
		test_winner("--X--X--X", 'X'),
		test_winner("O---O---O", 'O'),
		test_winner("--X-X-X--", 'X')
		)
	puts 'passed!'
end
