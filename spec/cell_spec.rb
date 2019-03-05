# frozen_string_literal: true

require 'rspec'
require_relative '../lib/cell.rb'

describe Cell do
  subject { Cell.new(1, 1) }
  it { is_expected.to respond_to :alive, :alive?, :x_coord, :y_coord }

  it 'is dead by default' do
    expect(subject.alive).to be false
    expect(subject).not_to be_alive
  end

  it 'has x and y coordinates' do
    expect(subject.x_coord).to eq 1
    expect(subject.y_coord).to eq 1
  end

  it 'has neighbours, each with their own coordinates' do
    expect(subject.neighbours).to eq(
      [[0, 0], [1, 0], [2, 0], [0, 1], [2, 1], [0, 2], [1, 2], [2, 2]]
    )
  end
end
