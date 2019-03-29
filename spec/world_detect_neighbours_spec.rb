# frozen_string_literal: true

require_relative '../lib/world.rb'

describe World do
  subject { World.new(3, 3) }

  context 'finds cells neighbours' do
    before(:each) do
      subject.grid.each do |row|
        row.each do |col|
          col.alive = true
        end
      end
    end

    it 'searching in the right places' do
      expect(subject.neighbours_of(1, 1)).to include(
        [0, 0], [0, 1], [0, 2], [1, 0], [1, 2], [2, 0], [2, 1], [2, 2]
      )
    end

    it 'in all directions' do
      expect(subject.count_live_neighbours(1, 1)).to eq 8
    end

    it 'does not count neighbours with negative coordinates' do
      expect(subject.count_live_neighbours(0, 0)).to eq 3
    end

    it 'does not count neighbours with higher coordinates than grid size' do
      expect(subject.count_live_neighbours(2, 2)).to eq 3
    end
  end
end
