# frozen_string_literal: true

describe World do
  subject { World.new(3, 3) }

  context 'finds cells neighbours' do
    before(:each) do
      subject.grid[1][1].alive = true
      subject.grid[0][1].alive = true
      subject.grid[2][1].alive = true
      subject.grid[1][2].alive = true
      subject.grid[1][0].alive = true
      subject.grid[0][0].alive = true
      subject.grid[0][2].alive = true
      subject.grid[2][0].alive = true
      subject.grid[2][2].alive = true
    end
    it 'searching in the right places' do
      expect(subject.find_neighbours(1, 1)).to include(
        [0, 0], [0, 1], [0, 2], [1, 0], [1, 2], [2, 0], [2, 1], [2, 2]
      )
    end

    it 'in all directions' do
      expect(subject.count_live_neighbours(1, 1)).to eq 8
    end

    it 'does not count neighbours with negative coordinates' do
      expect(subject.count_live_neighbours(0, 0)).to eq 3
    end
  end
end
