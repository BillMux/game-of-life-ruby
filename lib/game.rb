require_relative 'cell'
require_relative 'world'

# contains rules and logic to run the Game of Life
class Game
  attr_reader :world, :seeds

  def initialize(world = World.new(20, 20), seeds = [])
    @world = world
    @seeds = seeds
    plant_seeds
  end

  def plant_seeds
    @seeds.each do |seed|
      @world.grid[seed[0]][seed[1]].alive = true
    end
  end
end
