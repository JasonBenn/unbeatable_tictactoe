# IMPLEMENTATION

class TicTacToe
	attr_reader :board
	def initialize(board)
		@board = board.insert(6, "\n").insert(3, "\n")
	end

	def winner?
		['X', 'O'].each do |player|
			[row, column].each do |lane|
				return player if lane.include?(player*3)
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
end

# TEST HARNESS

def test(*bools)
	bools.each_with_index do |result, i|
		unless result
			puts "Test ##{i+1} failed!"
			abort
		end
	end
end

# TESTS

test(
	TicTacToe.new("XXXOO----").winner? == 'X',
	TicTacToe.new("XX-OOO---").winner? == 'O',
	TicTacToe.new("XO-XOOX--").winner? == 'X'
	)
puts 'passed!'
