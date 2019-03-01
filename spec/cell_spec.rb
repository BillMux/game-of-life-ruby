require 'rspec'
require_relative '../lib/cell.rb'

describe Cell do
  it { is_expected.to respond_to :alive }

  it 'is dead by default' do
    expect(subject.alive).to be false
  end
end
