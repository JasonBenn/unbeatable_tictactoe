require './tictactoe'
require './view'
require './inputvalidator'

class AI
	include InputValidator
	attr_reader :icon

	def initialize(icon)
		@icon = icon
	end

	def choose_next_move(board_string)
		return winning_move(board_string) if winning_move(board_string)
		probabilities_array = calculate_probability(board_string)
		index_of_max(probabilities_array)
	end

	def winning_move(board_string)
		empty_spaces(board_string).each do |space|
			dup_board = board_string.dup
			dup_board[space] = @icon
			return space if TicTacToe.new(dup_board).winner?
		end
		nil
	end

	def calculate_probability(board_string)
		9.times.map do |space|
			board_string[space] == '-' ? 1 : 0
		end
	end

	def compute_possibilities(board_string, current_player, index, answers = [])
		board_string[index] = current_player
		game = TicTacToe.new(board_string)
		return answers << game.winner? if game.winner?
		empty_spaces(board_string).each do |space|
			compute_possibilities(board_string.dup, ['X', 'O'].reject { |icon| icon == current_player }[0], space, answers)
		end
		answers
	end

	def empty_spaces(board_string)
		9.times.select do |cell|
			board_string[cell] == '-'
		end
	end

	private

	def index_of_max(board_string)
		board_string.each_with_index.max[1]
	end
end

if $0 == __FILE__ || $0 == 'test.rb'
	require './test'
	ai = AI.new('X')

	# puts "RETURNED: #{ai.compute_possibilities('XX-OO-XO-', 'X', 2)}"

	Tester.test(
		ai.winning_move('-XX------') == 0,
		ai.winning_move('--X-X----') == 6,
		ai.winning_move('--X------') == nil,
		ai.empty_spaces('-XX--XX--') == [0, 3, 4, 7, 8],
		ai.empty_spaces('---------') == (0..8).to_a,
		ai.choose_next_move('XXXXXXXX-') == 8,
		ai.choose_next_move('-XXXXXXXX') == 0,
		ai.choose_next_move('-XX-XXXXX') == 0,
		ai.compute_possibilities('XX-OO-XO-', 'X', 2) == ['X'],
		ai.compute_possibilities('XX-OO-XO-', 'X', 5).sort == ['D', 'X'],
		ai.compute_possibilities('XX-OO-XO-', 'X', 8).sort == ['D', 'O']
		)
	puts 'passed: ai.rb!'
end
