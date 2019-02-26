require 'rspec'
require_relative '../lib/world.rb'

describe World do

  it 'begins with a 20x20 world' do
    expect(subject.grid).to eq(Array.new(20){ Array.new(20, 1) })
  end
end
