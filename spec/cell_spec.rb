# frozen_string_literal: true

require_relative '../lib/cell.rb'

describe Cell do
  subject { Cell.new(1, 1) }
  it { is_expected.to respond_to :x_coord, :y_coord, :alive, :alive? }

  it 'is dead by default' do
    expect(subject).not_to be_alive
  end

  it 'has x and y coordinates' do
    expect(subject.x_coord && subject.y_coord).to eq 1
  end
end
