# frozen_string_literal: true

require_relative '../lib/cell.rb'

describe Cell do
  subject { Cell.new(1, 1, 3, 3) }
  it { is_expected.to respond_to :x_coord, :y_coord, :neighbours }
  it { is_expected.to respond_to :alive, :alive?, :grid_width, :grid_length }

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

  it 'does not have neighbours on edge sides' do
    subject2 = Cell.new(0, 1, 3, 3)
    subject3 = Cell.new(2, 1, 3, 3)
    expect(subject2.neighbours).to eq([[0, 0], [1, 0], [1, 1], [0, 2], [1, 2]])
    expect(subject3.neighbours).to eq([[1, 0], [2, 0], [1, 1], [1, 2], [2, 2]])
  end

  it 'knows dimensions of world' do
    expect(subject.grid_width).to eq 3
    expect(subject.grid_length).to eq 3
  end
end
