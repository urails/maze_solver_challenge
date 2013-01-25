# Maze Solver

## Usage

Programs will be run like so:

    ruby maze_solver.rb maze.txt

where `maze.txt` will be of the form:

```
######
#....#
#..#.#
#..#.E
#S####
```

`#` are walls, `.` are movable spaces, `S` is the starting position and `E` is the end of the maze. You goal is from `S` to `E` by only moving on movable spaces. You program should print out either `No solution` if a solution can't be found. If a solution is found, it should print out the board with `+` indicating the path it took. For example:

```
######
#.+++#
#.+#+#
#++#+E
#S####
```

Your program should either print "No solution." if it could not find a solution, or print a string of directions from `S` to `E` (N, E, S, W) if there was a solution. Examples:

```
# No solution
$ ruby maze_solver.rb maze.txt
No solution

# Has solution
$ ruby maze_solver.rb maze.txt
NNNEEESSE
```

## Phase 1 - Parsing

You first need to parse in the file. You can assume that all rows are the same length and all columns are the same length, though there can be a different number of rows and columns. That is, the board can be 10 rows and 20 columns, and every row will have exactly 20 columns. You can assume the board is properly formatted (i.e. It always has one `S` and one `E` and `#` or `.` otherwise, columns and rows are all the right length, etc.)

## Phase 2 - Solving

You may use whichever method you like to solve it, though I will describe my method here.

* Parse the board into an array of arrays called `board`
* Create another array of arrays that will store booleans for visited spaces on the board called `visited`
* Parse in the board, filling in the `visited` arrays as necessary with `true` or `false`
* While parsing, find the coordinates of the `S` and `E` in the board, store them in a Point object.
* Mark all "walls" as visited in the visited array.
* Create another array of arrays where we'll store all solutions called `solutions`
* Starting at `S`, check all surrounding spaces.
* If you find an open space (`.`):
    * Append the direction you moved (`N`, `S`, `E`, `W`) to find that space to the string already in the space you are in.
* If you don't find an open space, just return.
* When you're done, check the `E` spot. If it's null, there was no solution, if it's not, then there should be a string of the exact movements to take to get from `S` to `E`.
* Loop through the solution, inserting `+` with each movement.

## Phase 3 - Printing

Once the maze is solved, your program should print "No soltuion." if no solution was found, or print the solution string:
