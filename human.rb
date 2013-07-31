require './inputvalidator'

class Human
	include InputValidator
	attr_reader :icon

	def initialize(icon)
		@icon = icon
	end

	def choose_next_move(board_string)
		input = $stdin.gets.to_i
		until move_valid?(board_string, input)
			input = choose_next_move(board_string)
		end
		input
	end
end

