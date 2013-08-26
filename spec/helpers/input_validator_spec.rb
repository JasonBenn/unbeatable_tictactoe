require 'rspec'
require_relative '../../app/helpers/input_validator'

describe InputValidator do
	it "should return false for invalid move" do
		expect(InputValidator.move_valid?('X--------', 0)).to be_false
	end

	it "should return true for valid move" do
	  expect(InputValidator.move_valid?('---------', 0)).to be_true
	end
end
