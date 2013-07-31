class Counter
  attr_reader :winners

  def initialize
    @winners = {'X' => 0, 'O' => 0, 'D' => 0}
  end

  def show(board)
  end

  def congratulate(winner)
    @winners[winner] += 1
  end

  def display_results(tests)
    puts "Game outcomes: RandomAI (X) vs. Smart AI (O) #{tests} times:"
    @winners.each do |result, count|
      puts "#{result}: #{count}"
    end
  end
end
