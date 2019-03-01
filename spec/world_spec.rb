require 'rspec'
require_relative '../lib/world.rb'
require_relative '../lib/cell.rb'

describe World do
  let(:cell) { double :cell }

  it { is_expected.to respond_to :rows, :cols, :grid }

  it 'begins with a 20x20 cell grid' do
    expect(subject.grid.length).to eq 20
    subject.grid.each do |row|
      expect(row.length).to eq 20
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
