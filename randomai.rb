require './tictactoe'

class RandomAI < Struct.new(:icon)
	def choose_next_move(game)
		choice = game.empty_spaces.sample
		game.history << [icon, choice]
		choice
	end
end
