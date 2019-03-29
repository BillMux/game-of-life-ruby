# frozen_string_literal: true

require_relative '../lib/game.rb'

describe Game do
  let(:world) { World.new(3, 3) }
  subject { Game.new(world, [[1, 1], [0, 1]]) }

  it { is_expected.to respond_to :world, :seeds, :tick! }

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

  context 'when cell is alive' do
    it 'dies if less than two live neighbours' do
      subject.tick!
      expect(subject.world.grid[1][1]).not_to be_alive
      expect(subject.world.grid[1][2]).not_to be_alive
    end

    it 'dies if more than three live neighbours' do
      subject.seeds.push([2, 1], [0, 0])
      expect(subject.world.grid[1][1]).to be_alive
      subject.tick!
      expect(subject.world.grid[1][1]).not_to be_alive
    end
  end

  context 'when cell is dead, and has three live neighbours' do
    it 'is brought back to life' do
      subject.seeds.delete([1, 1])
      subject.seeds.push([2, 1], [0, 0])
      expect(subject.world.grid[1][1]).to be_alive
    end
  end
end
