require 'rspec'
require_relative '../lib/cell.rb'
require_relative '../lib/game.rb'
require_relative '../lib/world.rb'

describe Game do
  let(:world) { World.new(3, 3) }
  let(:subject_cell) { Cell.new(1, 1) }
  subject { Game.new(world, []) }

  it 'initialises with the world object' do
    expect(subject.world).to be_an_instance_of World
  end

  it 'initialises with seeds' do
    expect(subject.seeds).to be_an_instance_of Array
  end

  it 'plants seeds, cells become alive' do
    subject.seeds << [0, 0]
    expect(world.grid[0][0]).to be_alive
  end

  it 'should respond to methods' do
    expect(subject).to respond_to :world
    expect(subject).to respond_to :seeds
  end

  context 'when cell is alive' do
    before(:each) do
      subject_cell.alive = true
    end

    # it 'dies if less than two live neighbours' do
    #   expect(subject_cell.alive).to eq false
    # end
  end
end
