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

if $0 == __FILE__
	require './test'
	ai = AI.new('X')
	Tester.test(
		ai.choose_next_move('XX-------') == 2,
		ai.choose_next_move('OO-------') == 2,
		ai.choose_next_move('OO-XX----') == 5,
		ai.choose_next_move('XOX------') == 4,
		)
end
