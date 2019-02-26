require 'gosu'

class GameOfLife
  attr_reader :world

  def initialize
    @world = Array.new(20){ Array.new(20, 1) }
  end

end
