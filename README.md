unbeatable_tictactoe
====================

This is an unbeatable game of Tic Tac Toe, with significantly better performance than a Minimax algorithm-based solution.

There are a few command line options:

1.  Play an ordinary game, you first, with `ruby game_loop.rb`
2.  Let the AI play first with `ruby game_loop.rb ai-first`
3.  Finally, you can run the program N times with `ruby game_loop.rb test 1000` (replace 1000 with whatever number you like, obvs) to display a summary of game outcomes.

#####Benchmark results:

|           |   user   |  total   |     real
|-----------|----------|----------|------------
|1 test     | 0.000000 | 0.000000 | (  0.002719)
|10 tests   | 0.020000 | 0.020000 | (  0.018756)
|100 tests  | 0.180000 | 0.190000 | (  0.179415)
|1000 tests | 1.770000 | 1.770000 | (  1.773318)
|5000 tests | 9.050000 | 9.050000 | (  9.055244)
