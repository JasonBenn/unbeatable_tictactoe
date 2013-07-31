unbeatable_tictactoe
====================

This is an unbeatable game of Tic Tac Toe, with significantly better performance than a Minimax algorithm-based solution.

There are a few command line options:

1.  Play an ordinary game, you first, with `ruby game_loop.rb`
2.  Let the AI play first with `ruby game_loop.rb ai-first`
3.  Finally, you can run the program N times with `ruby game_loop.rb test 1000` (replace 1000 with whatever number you like, obvs) to display a summary of game outcomes.

The AI chooses options based on the following algorithm (see `AI#choose_next_move`):

1.  If a winning move exists, take it
2.  If the opponent has a winning move, block it
3.  If the AI has the middle cell and the opponent has opposite corners, the only way to avoid losing is to take an edge cell (in this case, we arbitrarily select the cell at index 1. See `AI#danger_case`)
4.  Otherwise, score all moves based on the results of `TicTacToe#score`, and choose the move with the highest score.  Building forks (situations in which two paths to victory are possible) are scored highly.

The scoring algorithm was originally developed while building towards an implementation of the Minimax algorithm. I implemented Step 3 when I noticed that the other three steps only lost about 4% of the time against a random AI and went looking for a pattern (and found one!).


#####Benchmark results:

|           |   user   |  total   |     real
|-----------|----------|----------|------------
|1 test     | 0.000000 | 0.000000 | (  0.002719)
|10 tests   | 0.020000 | 0.020000 | (  0.018756)
|100 tests  | 0.180000 | 0.190000 | (  0.179415)
|1000 tests | 1.770000 | 1.770000 | (  1.773318)
|5000 tests | 9.050000 | 9.050000 | (  9.055244)
