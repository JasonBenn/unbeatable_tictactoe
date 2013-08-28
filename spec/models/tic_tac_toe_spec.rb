require_relative '../spec_helper'

describe TicTacToe do
  let(:ttt) { TicTacToe }

  context "declare correct player has won" do
    it "when player has a row" do
      expect(ttt.new("XXX------").winner?).to eq 'X'
    end

    it "when player has a column" do
      expect(ttt.new("X--X--X--").winner?).to eq 'X'
    end

    it "when player has one diagonal" do
      expect(ttt.new("X---X---X").winner?).to eq 'X'
    end

    it "when player has opposite diagonal" do
      expect(ttt.new("--X-X-X--").winner?).to eq 'X'
    end
  end

  context "when no player has won" do
    it "player has three cells" do
      expect(ttt.new("X-X-X----").winner?).to be_false
    end

    it "in a draw" do
      expect(ttt.new("XOXOXOOXO").winner?).to eq 'D'
    end
  end

  context "#empty_cells" do
    it "returns all nine cells before a move is made" do
      expect(ttt.new('---------').empty_cells).to match_array (0..8).to_a
    end

    it "returns remaining cells when a move has been made" do
      expect(ttt.new('--------X').empty_cells).to match_array (0..7).to_a
    end
  end
end
