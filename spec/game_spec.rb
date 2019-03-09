# frozen_string_literal: true

require 'rspec'
require_relative '../lib/cell.rb'
require_relative '../lib/game.rb'
require_relative '../lib/world.rb'

describe Game do
  subject { Game.new(World.new(3, 3), [[1, 1]]) }

  it { is_expected.to respond_to :world, :seeds }

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

  context 'when cell is alive' do
    before(:each) do
      subject = Game.new(World.new(3, 3), [[1, 1], [1, 2]])
      subject.tick!
    end

    # it 'dies if less than two live neighbours' do
    #   expect(subject.world.grid[1][1]).not_to be_alive
    #   expect(subject.world.grid[1][2]).not_to be_alive
    # end
  end
end
