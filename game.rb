require_relative 'board.rb'
system("clear")

board = Board.new

puts "Welcome to Sudoku 1.0!"
sleep(2)

while !board.solved?
  system("clear")
  puts "Currently playing Sudoku 1.0!"
  puts
  puts "  0 1 2 3 4 5 6 7 8"
  board.render
  puts
  board.user_update_tile
end

if board.solved?
  system("clear")
  puts "Congratulations! You Won"
  board.render
end