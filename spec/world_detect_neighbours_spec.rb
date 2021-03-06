# frozen_string_literal: true

require_relative '../lib/world.rb'

describe World do
  subject { World.new(3, 3) }

  context 'finds cells neighbours' do
    before(:each) do
      subject.grid.each do |row|
        row.each { |col| col.alive = true }
      end
    end

    it 'searching in the right places' do
      expect(subject.neighbours_of(1, 1)).to include(
        [0, 0], [0, 1], [0, 2], [1, 0], [1, 2], [2, 0], [2, 1], [2, 2]
      )
    end

    it 'in all directions' do
      expect(subject.neighbours_of(1, 1).count).to eq 8
    end

    it 'without counting neighbours beyond grid walls' do
      expect(subject.neighbours_of(0, 0).count).to eq 3
      expect(subject.neighbours_of(2, 2).count).to eq 3
    end

    it 'and counts the alive neighbours' do
      expect(subject.count_live_neighbours(1, 1)).to eq 8
    end
  end
end
