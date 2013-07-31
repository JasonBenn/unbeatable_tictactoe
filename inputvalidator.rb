module InputValidator
	extend self
	def move_valid?(board_string, input)
		valid = board_string[input] == '-'
		View.move_invalid unless valid
		valid
	end
end

if $0 == __FILE__
	require './test'
	require './view'

	Tester.test(
		!InputValidator.move_valid?('X--------', 0),
		InputValidator.move_valid?('---------', 0)
		)
end
