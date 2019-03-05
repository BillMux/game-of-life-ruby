# frozen_string_literal: true

require 'rspec'
require_relative '../lib/cell.rb'
require_relative '../lib/game.rb'
require_relative '../lib/world.rb'

describe Game do
  subject { Game.new(World.new(3, 3), [[1, 1]]) }

  it 'initialises with the world object' do
    expect(subject.world).to be_an_instance_of World
  end

  it 'initialises with seeds' do
    expect(subject.seeds).to be_an_instance_of Array
  end

  it 'plants seeds, cells become alive' do
    expect(subject.world.grid[1][1]).to be_alive
    expect(subject.world.grid[0][2]).not_to be_alive
  end

  it 'should respond to methods' do
    expect(subject).to respond_to :world
    expect(subject).to respond_to :seeds
  end

  context 'when cell is alive' do
    it 'dies if less than two live neighbours' do
      expect(subject.world.grid[1][1]).not_to be_alive
    end
  end
end
