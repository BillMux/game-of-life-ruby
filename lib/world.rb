# frozen_string_literal: true

require_relative 'cell'

# 2d world in which the Game takes place
class World
  attr_reader :rows, :cols, :grid

  def initialize(rows, cols)
    @rows = rows
    @cols = cols
    @grid = create_grid
  end

  def neighbours_of(cell_x, cell_y)
    [
      [cell_x - 1, cell_y - 1], [cell_x, cell_y - 1],
      [cell_x + 1, cell_y - 1], [cell_x - 1, cell_y],
      [cell_x + 1, cell_y], [cell_x - 1, cell_y + 1],
      [cell_x, cell_y + 1], [cell_x + 1, cell_y + 1]
    ].keep_if { |x, y| on_grid?(x, y) }
  end

  def count_live_neighbours(cell_x, cell_y)
    count = 0
    neighbours_of(cell_x, cell_y).each do |x, y|
      count += 1 if @grid[x][y].alive?
    end
    count
  end

  private

  def create_grid
    Array.new(@rows) do |row|
      Array.new(@cols) { |col| Cell.new(row, col) }
    end
  end

  def on_grid?(cell_x, cell_y)
    cell_x.between?(0, @rows - 1) && cell_y.between?(0, @cols - 1)
  end
end
