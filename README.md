# Game of Life


My recreation of John Horton Conway's Game of Life in Ruby. The app will open a window which contains a grid of cells that can be alive or dead. The pattern of cells of the current generation determines the pattern of the next generation. The starting cells are generated completely at random.

![Demo](images/game-of-life-1.gif)

### All cells abide by the following rules:

1. Any live cell with less than two live neighbours dies, as if by underpopulation.

2. Any live cell with two or three live neighbours lives on to the next generation.

3. Any live cell with more than three live neighbours dies, as if by overpopulation.

4. Any dead cell with exactly three live neighbours becomes a live cell, as if by reproduction.

Live cells are represented as black squares
Dead cells are represented as white squares

### Tech used:

- [Ruby 2.5.1](https://www.ruby-lang.org/en/)
- [RSpec](https://github.com/rspec/rspec)
- [RuboCop](https://github.com/rubocop-hq/rubocop)
- [SimpleCov](https://github.com/colszowka/simplecov)
- [Gosu](https://www.libgosu.org/)

## Running the app:

1. Clone this repo:
`git clone https://github.com/BillMux/game_of_life_ruby.git`

2. Install dependencies:
`bundle`

3. Run the app:
`ruby game_of_life.rb`

### Running the tests:
`rspec`

### Running the linter:
`rubocop`
