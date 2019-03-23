# frozen_string_literal: true

require_relative 'cell'

# 2d world in which the Game takes place
class World
  attr_reader :rows, :cols
  attr_accessor :grid

  def initialize(rows, cols)
    @rows = rows
    @cols = cols
    @grid = create_grid
  end

  def find_live_neighbours(x, y)
    [
      [x - 1, y - 1], [x, y - 1],
      [x + 1, y - 1], [x - 1, y],
      [x + 1, y], [x - 1, y + 1],
      [x, y + 1], [x + 1, y + 1]
    ]
  end

  def count_live_neighbours(x, y)
    count = 0
    find_live_neighbours(x, y).each { |x, y| count += 1 if @grid[x][y].alive? }
    count
  end

  def delete_edge_neighbours(cell)

  end

  private

  def create_grid
    Array.new(rows) do |row|
      Array.new(cols) { |col| Cell.new(row, col) }
    end
  end
end
