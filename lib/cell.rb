# frozen_string_literal: true

# the cells within world, which can be dead or alive
class Cell
  attr_accessor :alive, :neighbours
  attr_reader :x_coord, :y_coord

  def initialize(x_coord, y_coord)
    @alive = false
    @x_coord = x_coord
    @y_coord = y_coord
    @neighbours = [
      [x_coord - 1, y_coord - 1], [x_coord, y_coord - 1],
      [x_coord + 1, y_coord - 1], [x_coord - 1, y_coord],
      [x_coord + 1, y_coord], [x_coord - 1, y_coord + 1],
      [x_coord, y_coord + 1], [x_coord + 1, y_coord + 1]
    ]
    delete_edge_neighbours
  end

  def delete_edge_neighbours
    @neighbours.each do |coord|
      coord.each do |x|
        if x < 0
          @neighbours.delete(coord)
        end
      end
    end
  end

  def alive?
    alive
  end
end
