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

  def create_grid
    Array.new(rows) do |row|
      Array.new(cols) { |col| Cell.new(col, row) }
    end
  end

  def find_live_neighbours(cell)
    live_neighbours = []
    cell.neighbours.each do |x, y|
      live_neighbours << @grid[x][y] if @grid[x][y].alive?
    end
    live_neighbours
  end
end
