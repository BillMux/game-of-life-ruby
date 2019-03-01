require_relative 'cell'

class World
  attr_reader :rows, :cols, :grid

  def initialize(rows, cols)
    @rows = rows
    @cols = cols
    @grid = Array.new(rows) do |row|
      Array.new(cols) do |col|
        Cell.new(col, row)
      end
    end
  end
end
