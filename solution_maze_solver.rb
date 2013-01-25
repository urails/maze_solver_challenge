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

  def parse_board board_str
    @visited = []
    @board   = []
    
    maze = board_str.split("\n")

    maze.each_with_index do |line, row|
      line = line.split('')

      visited_row_arr = []
      line.each_with_index do |char, col|
        @start = Point.new(row, col) if char == 'S'
        @finish = Point.new(row, col) if char == 'E'
        if char == '.' or char == 'E'
          visited_row_arr << false 
        else
          visited_row_arr << true 
        end
      end
      @visited << visited_row_arr
    end
  end

  def visit point
    return if point.row < 0 || point.col < 0
    item = @visited[point.row]
    return if item.nil?
    item[point.col] = true
  end

  def visited? point
    return true if point.row < 0 || point.col < 0
    item = @visited[point.row]
    return true if item.nil? || item[point.col].nil?
    return item[point.col]
  end

  def explore!
    @solutions = []
    @visited.count.times do |i|
      @solutions << Array.new(@visited[0].count)
    end
    @solutions[@start.row][@start.col] = ""
    explore @start
  end

  def explore point
    surrounding = [
      [Point.new(point.row - 1, point.col    ), "N"],
      [Point.new(point.row    , point.col + 1), "E"],
      [Point.new(point.row + 1, point.col    ), "S"],
      [Point.new(point.row    , point.col - 1), "W"]
    ]

    surrounding.each do |direction|
      new_point = direction[0]
      movement_char = direction[1]
      if !self.visited?(new_point)
        self.visit new_point
        @solutions[new_point.row][new_point.col] = @solutions[point.row][point.col] + movement_char
        self.explore Point.new(new_point.row, new_point.col)
      end
    end
  end

  def print_solution
    solution = @solutions[@finish.row][@finish.col]
    if solution.nil?
      puts "No solution." 
    else
      puts solution
    end
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
