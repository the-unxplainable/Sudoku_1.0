require 'byebug'
require 'colorized_string'
require_relative 'tile'

class Board

  attr_accessor :grid, :puzzle

  def initialize
    @puzzle = File.read("puzzles/sudoku1.txt").split
    @grid = Array.new(9) {Array.new(9)}

    self.create_grid
    self.create_puzzle
  end

  def [](position)
    row, col = position
    grid[row][col]
  end

  def []=(position, value)
    row, col = position
    grid[row][col] = value
  end

  def create_grid
    (0...9).each do |idx_1|
      (0...9).each do |idx_2|
        grid[idx_1][idx_2] = Tile.new
      end
    end
  end

  def create_puzzle
    @puzzle.each_with_index do |row, i|
      row.each_char.with_index do |ele, j|
        if ele != "0"
          self[[i,j]].value = ele.to_i
          self[[i,j]].given = true
        else
          self[[i,j]].value = " "
        end
      end
    end
  end

  def for_render
    full_grid = []
    @grid.each do |row|
      line = []
      row.each do |tile|
        line << tile.to_s
      end
      full_grid << line
    end
    full_grid
  end

  def array_i_need
    full_grid = []
    @grid.each do |row|
      line = []
      row.each do |tile|
        if tile.value == " "
          line << 0
        else
          line << tile.value
        end
      end
      full_grid << line
    end
    full_grid
  end

  def render
    bob = []
    for_render.each_with_index do |line, i| 
      bob << i.to_s + " " + line.join("|".colorize(:color => :black, :background => :white)) 
    end
    puts bob
  end

  def user_update_tile
    print "Which position do you want to update? ex. 2,3: "
    position = gets.chomp.split(",").map { |ele| ele.to_i}
    print "What will be the new value at position #{position}? "
    value = gets.chomp.to_i
    if valid_play?(position, value)
      update_tile(position, value)
    end
  end

  def update_tile(position, value)
    if self[position].given == true
      puts "Cannot update a given value."
      sleep(2)
    else
      self[position].value = value
      puts "Position: #{position} is updating with #{value}"
      sleep(2)
    end
  end

  def valid_play?(position, value)
    position.each do |num|
      if num < 0 || num > 8
        puts "Position must be a number between 0 and 8"
        sleep(2)
        return false
      end
    end

    if value < 1 || value > 9 
      puts "Value must be a number between 1 and 9"
      sleep(2)
      return false
    end
    true
  end

  def rows_solved?
    array_i_need.all? { |row| row.sort == [1,2,3,4,5,6,7,8,9] }
  end

  def columns_solved?
    transposed_grid = []
    (0...9).each do |index|
      column = []
      array_i_need.each do |row|
        column << row[index]
      end
      transposed_grid << column
    end

    transposed_grid.all? { |col| col.sort == [1,2,3,4,5,6,7,8,9] }
  end

  def squares

    squares = []
    squares << square(0,0)
    squares << square(3,0)
    squares << square(6,0)
    squares << square(0,3)
    squares << square(3,3)
    squares << square(6,3)
    squares << square(0,6)
    squares << square(3,6)
    squares << square(6,6)

    squares
  end

  def square(num_1, num_2)
    square = []
    (num_1..num_1 + 2).each do |index_row|
      (num_2..num_2 + 2).each do |index_col|
        position = [index_row, index_col]
        if self[position].value == " "
          square << 0
        else
          square << self[position].value
        end
      end
    end
    square

  end

  def squares_solved?
    squares.all? { |square| square.flatten.sort == [1,2,3,4,5,6,7,8,9] }
  end

  def solved?
    squares_solved?
    rows_solved?
    columns_solved?
  end

end