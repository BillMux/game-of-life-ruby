# frozen_string_literal: true

require 'rspec'
require_relative '../lib/cell.rb'

describe Cell do
  subject { Cell.new(0, 0) }
  it { is_expected.to respond_to :alive }
  it { is_expected.to respond_to :alive? }

  it 'is dead by default' do
    expect(subject.alive).to be false
    expect(subject).not_to be_alive
  end

  it 'has x and y coordinates' do
    expect(subject).to respond_to :x
    expect(subject).to respond_to :y
    expect(subject.x).to eq 0
    expect(subject.y).to eq 0
  end
end
