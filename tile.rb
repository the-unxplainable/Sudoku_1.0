require 'colorize'
require 'colorized_string'
    
class Tile
  
  attr_accessor :value, :given

  def initialize
    @value = 0
    @given = false 
  end

  def inspect
    "value = #{@value} |given = #{@given}"
  end

  def to_s
    if given == true
      string = self.value.to_s
      return string.colorize(:color => :red, :background => :white)
    else
      return self.value.to_s.colorize(:color => :black, :background => :white)
    end
  end


end
