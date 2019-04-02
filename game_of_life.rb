# frozen_string_literal: true

require 'gosu'
require_relative 'lib/game'

# The frontend controller, powered by Gosu
class GameOfLife < Gosu::Window
  def initialize(width = 800, height = 600)
    @width = width
    @height = height
    setup_game

    @background = Gosu::Color.new(0xffdedede)
    @cell_colour = Gosu::Color.new(0xff121212)
    super width, height, false
    self.caption = "Conway's Game of Life by Bill Muxworthy"
  end

  def update; end

  def draw
    draw_quad(0, 0, @background,
              @width, 0, @background,
              @width, @height, @background,
              0, @height, @background)

    @game.world.grid.each do |grid|
      grid.each do |cell|
        cell_width = cell.x_coord * @col_width
        cell_height = cell.y_coord * @row_height
        if cell.alive?
          draw_cells(cell_width, cell_height, @cell_colour)
        else
          draw_cells(cell_width, cell_height, @background)
        end
      end
    end
  end

  def needs_cursor?
    true
  end

  private

  def draw_cells(width, height, colour)
    draw_quad(
      width, height, colour,
      width + @col_width, height, colour,
      width, height + @row_height, colour,
      width + @col_width, height + @row_height, colour
    )
  end

  def setup_game
    @rows = @width / 10
    @cols = @height / 10
    @game = Game.new(World.new(@rows, @cols))
    @game.world.randomly_populate
    @col_width = @height / @cols
    @row_height = @width / @rows
  end
end

GameOfLife.new.show
