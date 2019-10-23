# Sudoku Learning Goals
#   1. Understand what factory methods are and how to use them
#   2. Understand how classes interact and how to use require_relative
#   3. Be able to write and explain how bracket methods [] and []= work
#   4. Be able to use pry to test small parts of your code

# Create Classes
#   1. Tile
#   2. Board
#   3. Game

# Tile Class
#   1. @value = given or not
#   2. review colorize

# Board Class
#   1. @grid = stored grid of tiles
#   2. Board::from_file factory method to read a file and parse it into a two-dimensional Array containing Tile instances
#   3. method to update tile value at given @position
#   4. ||render = display current board's' state 
#   5. ||solved? for game over
#       a. ||row_solved?
#       b. ||column_solved?
#       c. ||square_solved?

Game Class
  1. @board = board (Board.new?)
  2. ||play loop that runs until the game is solved (prob ||solved?)
  3. play loop that runs until the game is solved
    a. ||render the board
    b. ||prompt player for input (@pos, @value)
    c. update the tile at @pos with @value
    d. get and validate input from user to keep program from crashing
  

#What is the tile#to_s method? (maybe we dont need this)