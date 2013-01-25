class Point
  attr_accessor :row, :col

  def initialize row, col
    @col, @row = col, row
  end

  def inspect
    "(#{row}, #{col})"
  end

  def to_s
    self.inspect
  end
end

class Maze
  def initialize board_str
    self.parse_board board_str
  end

  # Given a board string, create whatever data structures you need to reason about
  # the board, such as which places on the board have already been visited, etc.
  def parse_board board_str
    # Fill in
  end

  # Marks a point on the board as having been 'visited'. If you 'visit' a point, then
  # calling 'visited?' on that same point should always return true. e.g.
  #
  #   board = Board.new(...)
  #   point = Point.new(0, 0)
  #   board.visited?(point) # => false
  #   board.visit(point)
  #   board.visited?(point) # => true
  #
  # This method should also be tolerant to input outside the bounds of the board, returning
  # true if a point lies outside the boundaries.
  #
  def visit point
    # Fill in
  end

  # Returns true or false
  def visited? point
    # Fill in
  end

  # Prints "No solution" if no solution exists, or the series of directions (N, E, S, W) taken from
  # `S` to `E`. i.e. NNNWWWEEESEN
  def print_solution
    # Fill in
  end

  # Explores the maze and attempts to find a solution.
  def explore!
    # Fill in
  end

  private

    # If you are using recursion (you should), this is a nice helper method.
    def explore point
      # Fill in
    end
end

filename = ARGV[0]

maze = nil
File.open filename, 'r' do |f|
  maze = f.read
end

solver = Maze.new(maze)
solver.explore!
solver.print_solution

