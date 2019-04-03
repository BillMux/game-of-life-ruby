# frozen_string_literal: true

require_relative 'world'

# contains rules and logic to run the Game of Life
class Game
  attr_reader :world, :seeds

  # if you would like to customise the starting point of the game
  # comment line 64 in game_of_life.rb
  # add some arrays with [x, y] coordinates to the seeds array
  # some examples:
  # blinker: [[1, 0], [1, 1], [1, 2]]
  # glider: [[1, 0], [2, 1], [0, 2], [1, 2], [2, 2]]
  def initialize(world = World.new(20, 20), seeds = [])
    @world = world
    @seeds = seeds
    plant_seeds
  end

  def tick!
    @live_next_round = []
    @dead_next_round = []
    @world.grid.each_with_index do |row, x|
      row.each_with_index do |cell, y|
        dead_or_alive(cell, @world.count_live_neighbours(x, y))
      end
    end
    @live_next_round.each { |cell| cell.alive = true }
    @dead_next_round.each { |cell| cell.alive = false }
  end

  private

  def plant_seeds
    @seeds.each { |seed| @world.grid[seed[0]][seed[1]].alive = true }
  end

  def dead_or_alive(cell, live)
    if cell.alive? && (live < 2 || live > 3)
      @dead_next_round << cell
    elsif !cell.alive? && live == 3
      @live_next_round << cell
    end
  end
end
