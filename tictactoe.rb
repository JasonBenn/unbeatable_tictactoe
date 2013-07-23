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

puts board = TicTacToe.new("XXXOO----").winner?
puts board = TicTacToe.new("XX-OOO---").winner?
