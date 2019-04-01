# frozen_string_literal: true

require 'gosu'
require_relative 'lib/game'

class GameOfLife < Gosu::Window
  def initialize
    super 800, 600, false
    self.caption = "Bill's Game of Life"
  end

  def update
  end

  def draw
  end

  def needs_cursor?
    true
  end
end

GameOfLife.new.show
