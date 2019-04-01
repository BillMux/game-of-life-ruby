# frozen_string_literal: true

require_relative '../lib/game.rb'

describe Game do
  let(:world) { World.new(3, 3) }
  subject { Game.new(world, [[1, 1], [0, 1]]) }

  it { is_expected.to respond_to :world, :seeds, :tick!, :randomly_populate }

  it 'initialises with the world object' do
    expect(subject.world).to be_an_instance_of World
  end

  it 'initialises with seeds' do
    expect(subject.seeds).to be_an_instance_of Array
  end

  it 'plants seeds, cells become alive' do
    expect(subject.world.grid[1][1]).to be_alive
    expect(subject.world.grid[0][1]).to be_alive
    expect(subject.world.grid[0][2]).not_to be_alive
  end

  it 'randomly populates world' do
    world = World.new(3, 3)
    game = Game.new(world, [])
    expect(game.seeds).to be_empty
    expect(game.randomly_populate).not_to be_empty
  end
end
