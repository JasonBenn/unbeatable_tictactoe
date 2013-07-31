require 'benchmark'
require './game_loop'

def simulate(n)
  n.times do
    Game.new({
      view: Counter.new,
      player1: AI,
      player2: RandomAI
      }).play
  end
end

Benchmark.bm(10) do |x|
  x.report("1 game")     { simulate(1) }
  x.report("10 games")   { simulate(10) }
  x.report("100 games")  { simulate(100) }
  x.report("1000 games") { simulate(1000) }
  x.report("5000 games") { simulate(5000) }
end
