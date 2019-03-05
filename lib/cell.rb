# the cells within world, which can be dead or alive
class Cell
  attr_reader :alive, :x, :y

  def initialize(x, y)
    @alive = false
    @x = x
    @y = y
  end

  def alive?
    alive
  end
end
