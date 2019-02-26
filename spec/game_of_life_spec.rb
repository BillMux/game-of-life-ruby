require 'rspec'
require_relative '../lib/game_of_life.rb'

describe GameOfLife do

  it 'begins with a 20x20 world' do
    expect(subject.world).to eq(Array.new(20){ Array.new(20, 1) })
  end
end
