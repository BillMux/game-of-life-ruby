# frozen_string_literal: true

require_relative 'world'

# the cells within world, which can be dead or alive
class Cell
  attr_accessor :alive, :neighbours
  attr_reader :x_coord, :y_coord, :grid_width, :grid_length

  def initialize(x_coord, y_coord, grid_width, grid_length)
    @alive = false
    @x_coord = x_coord
    @y_coord = y_coord
    @grid_width = grid_width
    @grid_length = grid_length

    @neighbours = [
      [x_coord - 1, y_coord - 1], [x_coord, y_coord - 1],
      [x_coord + 1, y_coord - 1], [x_coord - 1, y_coord],
      [x_coord + 1, y_coord], [x_coord - 1, y_coord + 1],
      [x_coord, y_coord + 1], [x_coord + 1, y_coord + 1]
    ]
    delete_edge_neighbours
  end

  def alive?
    alive
  end

  private

  def delete_edge_neighbours
    @neighbours.each do |coord|
      if coord[0] >= @grid_width || coord[1] >= @grid_length
        @neighbours.delete(coord)
      end
      coord.each do |x|
        if x.negative?
          @neighbours.delete(coord)
        end
      end
    end
  end
end
