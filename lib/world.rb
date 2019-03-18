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

  def count_live_neighbours(cell)
    live_neighbours = 0
    cell.neighbours.each { |x, y| live_neighbours += 1 if @grid[x][y].alive? }
    live_neighbours
  end

  private

  def create_grid
    Array.new(rows) do |row|
      Array.new(cols) { |col| Cell.new(row, col, @rows, @cols) }
    end
  end
end
