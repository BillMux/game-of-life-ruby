# frozen_string_literal: true

require 'gosu'
require_relative 'lib/game'

class GameOfLife < Gosu::Window
  def initialize(width = 800, height = 600)
    @width = width
    @height = height
    @rows = @width / 10
    @cols = @height / 10
    @world = World.new(@rows, @cols)
    @game = Game.new(@world)
    @game.randomly_populate!

    @background_colour = Gosu::Color.new(0xffdedede)
    @cell_colour = Gosu::Color.new.rgb(0, 0, 0)

    super width, height, false
    self.caption = "BillMux's Game of Life"
  end

  def update
  end

  def draw
    draw_quad(0, 0, @background_colour,
              @width, 0, @background_colour,
              0, @height, @background_colour,
              @width, @height, @background_colour)
  end

  def needs_cursor?
    true
  end
end

GameOfLife.new.show
