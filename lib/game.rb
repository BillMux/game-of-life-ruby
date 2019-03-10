# frozen_string_literal: true

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

  def tick!
    @world.grid.each do |row|
      row.each do |cell|
        if cell.alive?
          # p @world.find_live_neighbours(cell)
        end
      end
    end
  end
end
