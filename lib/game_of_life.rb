require 'gosu'

class GameOfLife
  attr_reader :world

  def initialize
    rows, cols, default = 20, 20, 1
    @world = Array.new(rows){ Array.new(cols, default) }
  end

end
