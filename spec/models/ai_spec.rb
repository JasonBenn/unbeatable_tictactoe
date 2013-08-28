require_relative '../spec_helper'

describe AI do

	let(:ai) { AI.new('X') }

	describe "#choose_next_move" do
		context "when victor is imminent" do
			it "should complete a row" do
				expect(ai.choose_next_move('XX-------')).to eq 2
			end

			it "should block opponent's row" do
				expect(ai.choose_next_move('OO-------')).to eq 2
			end

			it "should complete a column" do
				expect(ai.choose_next_move('XOX------')).to eq 4
			end

			it "should complete a diagonal" do
				expect(ai.choose_next_move('XO--X----')).to eq 8
			end

			it "should choose a win over a block" do
				expect(ai.choose_next_move('OO-XX----')).to eq 5
			end

			it "should choose a win over a block" do
				expect(ai.choose_next_move('OO-XX----')).to eq 5
			end
		end

		context "in danger case: opponent has opposite corners, ai has center" do
			it "should correctly pick an edge" do
				expect(ai.choose_next_move('O---X---O')).to eq 1
			end
		end

		context "on empty board" do
			it "should pick middle" do
				expect(ai.choose_next_move('---------')).to eq 4
			end
		end
	end
end
