require './config/environment'

case ARGV[0]
when "test"
  counter = Counter.new
  ARGV[1].to_i.times do
    Game.new({
      view: counter,
      player1: RandomAI,
      player2: AI
      }).play
  end
  counter.display_results(ARGV[1])
when "ai-first"
    Game.new({
      player1: AI,
      player2: Human
      }).play
else
  Game.new.play
end
