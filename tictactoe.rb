# IMPLEMENTATION

class TicTacToe
	attr_reader :board
	def initialize(board)
		@board = board.insert(6, "\n").insert(3, "\n")
	end

	def winner?
		['X', 'O'].each do |player|
			return player if board.each_line.map(&:chomp).include?(player*3)
		end
	end
end


# TEST HARNESS

def test(*bools)
	bools.each_with_index do |result, i|
		unless result
			puts "Test ##{i} failed!"
			abort
		end
	end
end

# TESTS

test(
	TicTacToe.new("XXXOO----").winner? == 'X',
	TicTacToe.new("XX-OOO---").winner? == 'O'
	)
puts 'passed!'
