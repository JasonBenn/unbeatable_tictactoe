require './tictactoe'
require './view'
require './inputvalidator'

class AI
	include InputValidator
	attr_reader :icon

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

	def compute_possibilities(board_string, current_player, index, answers = [])
		game = TicTacToe.new(board_string)
		puts "board: #{game.board}"
		winner = winning_move(board_string)
		return winner if winner
		puts "winner: #{winner}"
		puts "answers: #{answers.flatten}"
		board_string[index] = current_player
		puts "board_string: #{board_string}"
		empty_spaces(board_string).each do |space|
			answers << compute_possibilities(board_string, current_player, space, answers)
		end
		answers
	end

	def calculate_probability(board_string)
		9.times.map do |space|
			board_string[space] == '-' ? 1 : 0
		end
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
		ai.winning_move('--X------') == false,
		ai.empty_spaces('-XX--XX--') == [0, 3, 4, 7, 8],
		ai.empty_spaces('---------') == (0..8).to_a,
		ai.calculate_probability('XXXXXX---') == [0, 0, 0, 0, 0, 0, 1, 1, 1],
		ai.choose_next_move('XXXXXXXX-') == 8,
		ai.choose_next_move('-XXXXXXXX') == 0,
		ai.choose_next_move('-XX-XXXXX') == 0,
		)
	puts 'passed: ai.rb!'
end
