# frozen_string_literal: true

require_relative '../lib/game.rb'

describe 'Game of Life rules' do
  let(:world) { World.new(3, 3) }
  subject { Game.new(world, [[1, 1], [0, 1]]) }

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
      game = Game.new(world, [[0, 0], [0, 1], [2, 1]])
      game.tick!
      expect(game.world.grid[1][1]).to be_alive
    end
  end
end
