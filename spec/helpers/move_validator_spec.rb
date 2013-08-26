require 'rspec'
require_relative '../../app/helpers/move_validator'

describe MoveValidator do
	it "should return false for invalid move" do
		expect(MoveValidator.move_valid?('X--------', 0)).to be_false
	end

	it "should return true for valid move" do
	  expect(MoveValidator.move_valid?('---------', 0)).to be_true
	end
end
