class World
  attr_reader :rows, :cols, :grid

  def initialize(rows = 20, cols = 20)
    @rows = rows
    @cols = cols
    @grid = Array.new(rows){ Array.new(cols, 1) }
  end
end
