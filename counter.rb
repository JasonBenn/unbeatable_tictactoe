class Counter
	attr_reader :winners

	def initialize
		@winners = {'X' => 0, 'O' => 0, 'D' => 0}
	end

	def show(board)
	end

	def congratulate(winner)
		@winners[winner] += 1
	end
end