# frozen_string_literal: true

# the cells within world, which can be dead or alive
class Cell
  attr_accessor :alive
  attr_reader :x_coord, :y_coord

  def initialize(x_coord, y_coord)
    @alive = false
    @x_coord = x_coord
    @y_coord = y_coord
  end

  def alive?
    alive
  end
end
