class TicTacToe
	attr_reader :board
	def initialize(board)
		@board = board.insert(6, "\n").insert(3, "\n")
	end

	def winner?
		board.each_line.map(&:chomp).include?('XXX')
	end
end

puts board = TicTacToe.new("XXXOO----").winner?
