# frozen_string_literal: true

require 'gosu'
require_relative 'lib/game'

# The frontend controller, powered by Gosu
class GameOfLife < Gosu::Window
  def initialize(width = 800, height = 600)
    @width = width
    @height = height
    @rows = @width / 10
    @cols = @height / 10
    @game = Game.new(World.new(@rows, @cols))
    @game.randomly_populate
    @col_width = @width / @cols
    @row_height = @height / @rows

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
          draw_quad(cell_width, cell_height, @cell_colour,
                    cell_width + @col_width, cell_height, @cell_colour,
                    cell_width, cell_height + @row_height, @cell_colour,
                    cell_width + @col_width, cell_height + @row_height, @cell_colour)
        else
          draw_quad(cell_width, cell_height, @background,
                    cell_width + @col_width, cell_height, @background,
                    cell_width, cell_height + @row_height, @background,
                    cell_width + @col_width, cell_height + @row_height, @background)
        end
      end
    end
  end

  def needs_cursor?
    true
  end
end

GameOfLife.new.show
