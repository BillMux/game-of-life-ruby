require_relative 'cell'
require_relative 'world'

class Game
  attr_reader :world, :seeds

  def initialize(world = World.new(20, 20), seeds = [])
    @world = world
    @seeds = seeds
  end
end
