# frozen_string_literal: true

describe World do
  subject { World.new(3, 3) }

  it 'knows where to find cell neighbours' do
    expect(subject.find_live_neighbours(1, 1)).to include(
      [0, 0], [0, 1], [0, 2], [1, 0], [1, 2], [2, 0], [2, 1], [2, 2]
    )
  end

  context 'counts cells live neighbours' do
    before(:each) do
      subject.grid[1][1].alive = true
    end

    it 'to the north, south, east and west' do
      subject.grid[0][1].alive = true
      subject.grid[2][1].alive = true
      subject.grid[1][2].alive = true
      subject.grid[1][0].alive = true
    end

    it 'diagonally' do
      subject.grid[0][0].alive = true
      subject.grid[0][2].alive = true
      subject.grid[2][0].alive = true
      subject.grid[2][2].alive = true
    end

    after(:each) do
      expect(subject.count_live_neighbours(1, 1)).to eq 4
    end
  end
end
