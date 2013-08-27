class TicTacToe
  attr_reader :board
  def initialize(board = '---------')
    @board = board
  end

  def winner?
    ['X', 'O'].each do |player_icon|
      sets_of_three.each do |set|
        actual = set.map { |cell| board[cell] }
        return player_icon if actual == [player_icon] * 3
      end
    end
    return 'D' unless board.include? '-'
    false
  end

  def empty_cells
    9.times.select { |n| board[n] == '-' }
  end

  def score(cell, opponent_icon)
    score = 0
    relevant_sets_of_three(cell).map do |path|
      case path.map { |cell| board[cell] }.count(opponent_icon)
      when 2 then score += 100
      when 1 then score += 10
      when 0 then score += 1
      end
    end
    score
  end

  private

  def sets_of_three
    [
      [0, 1, 2],
      [3, 4, 5],
      [6, 7, 8],

      [0, 3, 6],
      [1, 4, 7],
      [2, 5, 8],

      [0, 4, 8],
      [2, 4, 6]
    ]
  end

  def relevant_sets_of_three(cell)
    sets_of_three.select { |set| set.include? cell }
  end
end
