require 'rspec'
require_relative '../lib/cell.rb'

describe Cell do
  it { is_expected.to respond_to :alive }

  it 'is dead by default' do
    expect(subject.alive).to be false
  end

  it 'has x and y coordinates' do
    expect(subject).to respond_to :x_position
    expect(subject).to respond_to :y_position
  end
end
