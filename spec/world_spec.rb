require 'rspec'
require_relative '../lib/world.rb'
require_relative '../lib/cell.rb'

describe World do
  let(:cell) { double :cell }

  it { is_expected.to respond_to :rows, :cols, :grid }

  it 'begins with a 20x20 cell grid' do
    subject.grid.each do |row|
      expect(row).to be_an_instance_of Array
      row.each do |col|
        expect(col).to be_an_instance_of Cell
      end
    end
  end
end
