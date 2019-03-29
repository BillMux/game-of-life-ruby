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

  def tick!
    @world.grid.each_with_index do |row, y|
      row.each_with_index do |cell, x|
        if cell.alive?
          # cell must die if it has less than 2 live neighbours
          if @world.neighbours_of(x, y).count < 2
            cell.alive = false
          end
        end
      end
    end
  end

  private

  def plant_seeds
    @seeds.each do |seed|
      @world.grid[seed[0]][seed[1]].alive = true
    end
  end
end
