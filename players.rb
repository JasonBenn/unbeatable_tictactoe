# AI determines the square with the highest probability of winning

require './tictactoe'
require './view'

module InputValidator
	extend self
	def move_valid?(board_string, input)
		valid = board_string[input] == '-'
		View.move_invalid unless valid
		valid
	end
end

class Human
	include InputValidator

	def initialize(icon)
		@icon = icon
	end

	def choose_next_move(board_string)
		input = gets.to_i
		until move_valid?(board_string, input)
			input = choose_next_move(board_string)
		end
		input
	end
end

class AI
	include InputValidator

	def initialize(icon)
		@icon = icon
	end

	def winning_move(board_string)
		empty_spaces(board_string).each do |space|
			dup_board = board_string.dup
			dup_board[space] = @icon
			return space if TicTacToe.new(dup_board).winner?
		end
		false
	end

	def choose_next_move(board_string)
		return winning_move(board_string) if winning_move(board_string)
		probabilities_array = calculate_probability(board_string)
		index_of_max(probabilities_array)
	end

	def self.calculate_probability(board_string)
		9.times.map do |space|
			board_string[space] == '-' ? 1 : 0
		end
	end

	def self.empty_spaces(board_string)
		9.times.select do |cell|
			board_string[cell] == '-'
		end
	end

	private

	def self.index_of_max(board_string)
		board_string.each_with_index.max[1]
	end
end

test(
	AI.winning_move('-XX------') == 0,
 	AI.winning_move('--X-X----') == 6,
 	AI.winning_move('--X------') == false,
 	AI.empty_spaces('-XX--XX--') == [0, 3, 4, 7, 8],
 	AI.empty_spaces('---------') == (0..8).to_a,
 	AI.calculate_probability('XXXXXX---') == [0, 0, 0, 0, 0, 0, 1, 1, 1],
 	AI.choose_next_move('XXXXXXXX-') == 8,
 	AI.choose_next_move('-XXXXXXXX') == 0,
 	AI.choose_next_move('-XX-XXXXX') == 3
	)
puts 'passed!'
if $0 == __FILE__
	require './test'
	ai = AI.new

	Tester.test(
		ai.winning_move('-XX------') == 0,
		ai.winning_move('--X-X----') == 6,
		ai.winning_move('--X------') == false,
		ai.empty_spaces('-XX--XX--') == [0, 3, 4, 7, 8],
		ai.empty_spaces('---------') == (0..8).to_a,
		ai.calculate_probability('XXXXXX---') == [0, 0, 0, 0, 0, 0, 1, 1, 1],
		ai.choose_next_move('XXXXXXXX-') == 8, #7
		ai.choose_next_move('-XXXXXXXX') == 0,
		ai.choose_next_move('-XX-XXXXX') == 3,
		!InputValidator.move_valid?('X--------', 0),
		InputValidator.move_valid?('---------', 0)
		)
	puts 'passed!'
end
