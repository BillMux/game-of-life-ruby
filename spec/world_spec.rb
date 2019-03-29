# frozen_string_literal: true

require_relative '../lib/world.rb'

describe World do
  subject { World.new(3, 3) }

  it { is_expected.to respond_to :rows, :cols, :grid, :neighbours_of }

  it 'defaults to a cell grid of defined size' do
    expect(subject.grid.length).to eq 3
    subject.grid.each do |row|
      expect(row.length).to eq 3
    end
  end

  it 'contains 2d array of cell objects' do
    subject.grid.each do |row|
      expect(row).to be_an_instance_of Array
      row.each do |col|
        expect(col).to be_an_instance_of Cell
      end
    end
  end

  it 'can see cells "alive" method' do
    expect(subject.grid[0][0]).to respond_to :alive
  end
end
