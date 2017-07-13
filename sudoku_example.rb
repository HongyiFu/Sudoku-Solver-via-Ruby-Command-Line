require_relative 'sudoku'

# In the first 3 examples, eliminating would get us the solution without the need to guess.

board_string1 = '619030040270061008000047621486302079000014580031009060005720806320106057160400030'
board_string2 = '105802000090076405200400819019007306762083090000061050007600030430020501600308900'
board_string3 = '005030081902850060600004050007402830349760005008300490150087002090000600026049503' 

puts "Game 1:"
game = Sudoku.new(board_string1)
game.solve!
game.display_solution
puts "\nAre solution(s) valid? "
game.check_solutions
puts "\n--------------------\n"

=begin
Game 1:
Unique solution found. Sudoku solved with basic elimination.
Initial board: 
6 1 9 |   3   |   4  
2 7   |   6 1 |     8
      |   4 7 | 6 2 1
------ ------- ------
4 8 6 | 3   2 |   7 9
      |   1 4 | 5 8  
  3 1 |     9 |   6  
------ ------- ------
    5 | 7 2   | 8   6
3 2   | 1   6 |   5 7
1 6   | 4     |   3  

There is 1 solution.
Showing the only solution:
6 1 9 | 2 3 8 | 7 4 5
2 7 4 | 5 6 1 | 3 9 8
8 5 3 | 9 4 7 | 6 2 1
------ ------- ------
4 8 6 | 3 5 2 | 1 7 9
7 9 2 | 6 1 4 | 5 8 3
5 3 1 | 8 7 9 | 2 6 4
------ ------- ------
9 4 5 | 7 2 3 | 8 1 6
3 2 8 | 1 9 6 | 4 5 7
1 6 7 | 4 8 5 | 9 3 2

Time taken to solve the sudoku (finding all solutions, and exclude time needed to print the board): 0.002690488 seconds.

Are solution(s) valid? 
The only solution is valid.
=end

puts "Game 2:"
game = Sudoku.new(board_string2)
game.solve!
game.display_solution
puts "\nAre solution(s) valid? "
game.check_solutions
puts "\n--------------------\n"

=begin
Game 2:
Unique solution found. Sudoku solved with basic elimination.
Initial board: 
1   5 | 8   2 |      
  9   |   7 6 | 4   5
2     | 4     | 8 1 9
------ ------- ------
  1 9 |     7 | 3   6
7 6 2 |   8 3 |   9  
      |   6 1 |   5  
------ ------- ------
    7 | 6     |   3  
4 3   |   2   | 5   1
6     | 3   8 | 9    

There is 1 solution.
Showing the only solution:
1 4 5 | 8 9 2 | 6 7 3
8 9 3 | 1 7 6 | 4 2 5
2 7 6 | 4 3 5 | 8 1 9
------ ------- ------
5 1 9 | 2 4 7 | 3 8 6
7 6 2 | 5 8 3 | 1 9 4
3 8 4 | 9 6 1 | 7 5 2
------ ------- ------
9 5 7 | 6 1 4 | 2 3 8
4 3 8 | 7 2 9 | 5 6 1
6 2 1 | 3 5 8 | 9 4 7

Time taken to solve the sudoku (finding all solutions, and exclude time needed to print the board): 0.001941262 seconds.

Are solution(s) valid? 
The only solution is valid.
=end 

puts "Game 3:"
game3 = Sudoku.new(board_string3)
game3.solve!
game3.display_solution
puts "\nAre solution(s) valid? "
game.check_solutions
puts "\n--------------------\n"

=begin
Game 3:
Unique solution found. Sudoku solved with basic elimination.
Initial board: 
    5 |   3   |   8 1
9   2 | 8 5   |   6  
6     |     4 |   5  
------ ------- ------
    7 | 4   2 | 8 3  
3 4 9 | 7 6   |     5
    8 | 3     | 4 9  
------ ------- ------
1 5   |   8 7 |     2
  9   |       | 6    
  2 6 |   4 9 | 5   3

There is 1 solution.
Showing the only solution:
4 7 5 | 9 3 6 | 2 8 1
9 3 2 | 8 5 1 | 7 6 4
6 8 1 | 2 7 4 | 3 5 9
------ ------- ------
5 1 7 | 4 9 2 | 8 3 6
3 4 9 | 7 6 8 | 1 2 5
2 6 8 | 3 1 5 | 4 9 7
------ ------- ------
1 5 3 | 6 8 7 | 9 4 2
7 9 4 | 5 2 3 | 6 1 8
8 2 6 | 1 4 9 | 5 7 3

Time taken to solve the sudoku (finding all solutions, and exclude time needed to print the board): 0.001867189 seconds.

Are solution(s) valid? 
The only solution is valid.
=end

# Sudokus with more than 1 solutions

board_string = "906070403000400200070023010500000100040208060003000005030700050007005000405010708"
game = Sudoku.new(board_string)
game.solve!
game.display_solution
puts "\nAre solution(s) valid? "
game.check_solutions
puts "\n--------------------\n"

=begin 
Solution 1 found.
Solution 2 found.
Initial board: 
9   6 |   7   | 4   3
      | 4     | 2    
  7   |   2 3 |   1  
------ ------- ------
5     |       | 1    
  4   | 2   8 |   6  
    3 |       |     5
------ ------- ------
  3   | 7     |   5  
    7 |     5 |      
4   5 |   1   | 7   8

There are 2 solutions.
Showing all 2 solutions:
9 2 6 | 5 7 1 | 4 8 3
3 5 1 | 4 8 6 | 2 7 9
8 7 4 | 9 2 3 | 5 1 6
------ ------- ------
5 8 2 | 3 6 7 | 1 9 4
1 4 9 | 2 5 8 | 3 6 7
7 6 3 | 1 4 9 | 8 2 5
------ ------- ------
2 3 8 | 7 9 4 | 6 5 1
6 1 7 | 8 3 5 | 9 4 2
4 9 5 | 6 1 2 | 7 3 8

9 2 6 | 5 7 1 | 4 8 3
3 5 1 | 4 8 6 | 2 7 9
8 7 4 | 9 2 3 | 5 1 6
------ ------- ------
5 8 2 | 3 6 7 | 1 9 4
1 4 9 | 2 5 8 | 3 6 7
7 6 3 | 1 9 4 | 8 2 5
------ ------- ------
2 3 8 | 7 4 9 | 6 5 1
6 1 7 | 8 3 5 | 9 4 2
4 9 5 | 6 1 2 | 7 3 8

Time taken to solve the sudoku (finding all solutions, and exclude time needed to print the board): 0.019564305 seconds.

Are solution(s) valid? 
All 2 solutions are valid.
=end

game = Sudoku.new( ("1".."9").to_a.join("") + "0"*72 )
game.solve!
game.display_solution
puts "\nAre solution(s) valid? "
game.check_solutions
puts "\n--------------------\n"

=begin 
200 solutions found thus far. Stopped finding further solutions.
Initial board: 
1 2 3 | 4 5 6 | 7 8 9
      |       |      
      |       |      
------ ------- ------
      |       |      
      |       |      
      |       |      
------ ------- ------
      |       |      
      |       |      
      |       |      

There are 200 solutions.
Showing the first 5 solutions (chosen at random):
1 2 3 | 4 5 6 | 7 8 9
4 5 6 | 7 8 9 | 1 2 3
7 8 9 | 1 2 3 | 4 5 6
------ ------- ------
2 1 4 | 3 6 5 | 8 9 7
3 6 5 | 8 9 7 | 2 1 4
8 9 7 | 2 1 4 | 3 6 5
------ ------- ------
5 3 1 | 9 4 8 | 6 7 2
6 4 2 | 5 7 1 | 9 3 8
9 7 8 | 6 3 2 | 5 4 1

1 2 3 | 4 5 6 | 7 8 9
4 5 6 | 7 8 9 | 1 2 3
7 8 9 | 1 2 3 | 4 5 6
------ ------- ------
2 1 4 | 3 6 5 | 8 9 7
3 6 5 | 8 9 7 | 2 1 4
8 9 7 | 2 1 4 | 3 6 5
------ ------- ------
5 3 8 | 9 7 2 | 6 4 1
9 4 2 | 6 3 1 | 5 7 8
6 7 1 | 5 4 8 | 9 3 2

1 2 3 | 4 5 6 | 7 8 9
4 5 6 | 7 8 9 | 1 2 3
7 8 9 | 1 2 3 | 4 5 6
------ ------- ------
2 1 4 | 3 6 5 | 8 9 7
3 6 5 | 8 9 7 | 2 1 4
8 9 7 | 2 1 4 | 3 6 5
------ ------- ------
5 3 1 | 9 7 8 | 6 4 2
9 7 2 | 6 4 1 | 5 3 8
6 4 8 | 5 3 2 | 9 7 1

1 2 3 | 4 5 6 | 7 8 9
4 5 6 | 7 8 9 | 1 2 3
7 8 9 | 1 2 3 | 4 5 6
------ ------- ------
2 1 4 | 3 6 5 | 8 9 7
3 6 5 | 8 9 7 | 2 1 4
8 9 7 | 2 1 4 | 3 6 5
------ ------- ------
5 3 1 | 9 7 2 | 6 4 8
6 7 8 | 5 4 1 | 9 3 2
9 4 2 | 6 3 8 | 5 7 1

1 2 3 | 4 5 6 | 7 8 9
4 5 6 | 7 8 9 | 1 2 3
7 8 9 | 1 2 3 | 4 5 6
------ ------- ------
2 1 4 | 3 6 5 | 8 9 7
3 6 5 | 8 9 7 | 2 1 4
8 9 7 | 2 1 4 | 3 6 5
------ ------- ------
5 3 2 | 6 7 1 | 9 4 8
6 4 8 | 9 3 2 | 5 7 1
9 7 1 | 5 4 8 | 6 3 2

Time taken to solve the sudoku (finding all solutions, and exclude time needed to print the board): 1.17330414 seconds.

Are solution(s) valid? 
All 200 solutions are valid.
=end 

game3 = Sudoku.new("1"+"0"*80)
game3.solve!
game3.display_solution
puts "\nAre solution(s) valid? "
game.check_solutions
puts "\n--------------------\n"

=begin 
200 solutions found thus far. Stopped finding further solutions.
Initial board: 
1     |       |      
      |       |      
      |       |      
------ ------- ------
      |       |      
      |       |      
      |       |      
------ ------- ------
      |       |      
      |       |      
      |       |      

There are 200 solutions.
Showing the first 5 solutions (chosen at random):
1 2 3 | 4 5 6 | 7 8 9
4 5 6 | 7 8 9 | 1 2 3
7 8 9 | 1 2 3 | 4 5 6
------ ------- ------
2 1 4 | 3 6 5 | 8 9 7
3 6 5 | 8 9 7 | 2 1 4
8 9 7 | 2 1 4 | 3 6 5
------ ------- ------
5 3 2 | 6 7 8 | 9 4 1
6 4 8 | 9 3 1 | 5 7 2
9 7 1 | 5 4 2 | 6 3 8

1 2 3 | 4 5 6 | 7 8 9
4 5 6 | 7 8 9 | 1 2 3
7 8 9 | 1 2 3 | 4 5 6
------ ------- ------
2 1 4 | 3 6 5 | 8 9 7
3 6 5 | 8 9 7 | 2 1 4
8 9 7 | 2 1 4 | 3 6 5
------ ------- ------
5 3 8 | 6 7 1 | 9 4 2
6 7 2 | 9 4 8 | 5 3 1
9 4 1 | 5 3 2 | 6 7 8

1 2 3 | 4 5 6 | 7 8 9
4 5 6 | 7 8 9 | 1 2 3
7 8 9 | 1 2 3 | 4 5 6
------ ------- ------
2 1 4 | 3 6 5 | 8 9 7
3 6 5 | 8 9 7 | 2 1 4
8 9 7 | 2 1 4 | 3 6 5
------ ------- ------
5 3 1 | 6 4 8 | 9 7 2
9 7 2 | 5 3 1 | 6 4 8
6 4 8 | 9 7 2 | 5 3 1

1 2 3 | 4 5 6 | 7 8 9
4 5 6 | 7 8 9 | 1 2 3
7 8 9 | 1 2 3 | 4 5 6
------ ------- ------
2 1 4 | 3 6 5 | 8 9 7
3 6 5 | 8 9 7 | 2 1 4
8 9 7 | 2 1 4 | 3 6 5
------ ------- ------
5 3 8 | 6 7 2 | 9 4 1
9 7 2 | 5 4 1 | 6 3 8
6 4 1 | 9 3 8 | 5 7 2

1 2 3 | 4 5 6 | 7 8 9
4 5 6 | 7 8 9 | 1 2 3
7 8 9 | 1 2 3 | 4 5 6
------ ------- ------
2 1 4 | 3 6 5 | 8 9 7
3 6 5 | 8 9 7 | 2 1 4
8 9 7 | 2 1 4 | 3 6 5
------ ------- ------
5 3 2 | 9 7 8 | 6 4 1
9 4 1 | 6 3 2 | 5 7 8
6 7 8 | 5 4 1 | 9 3 2

Time taken to solve the sudoku (finding all solutions, and exclude time needed to print the board): 1.282088311 seconds.

Are solution(s) valid? 
All 200 solutions are valid.
=end

# Read board string from 'sample_unsolved.txt'. Some of these boards require guessing: 
arr = File.readlines('sample_unsolved.txt').map(&:strip)
arr.each_with_index do |board_string,i|
	puts "Guessing board #{i+1} from 'sample_unsolved.txt':"
  game = Sudoku.new(board_string)
  game.solve!
  game.display_solution
  puts "\nAre solution(s) valid? "
  game.check_solutions
  puts "\n--------------------\n"
end

=begin

Guessing board 1 from 'sample_unsolved.txt':
Solution 1 found.
Initial board: 
  9 6 |   4   |     1
1     |   6   |     4
5   4 | 8 1   | 3 9  
------ ------- ------
    7 | 9 5   |   4 3
  3   |   8   |      
4   5 |   2 3 |   1 8
------ ------- ------
  1   | 6 3   |   5 9
  5 9 |   7   | 8 3  
    3 | 5 9   |     7

There is 1 solution.
Showing the only solution:
3 9 6 | 2 4 5 | 7 8 1
1 7 8 | 3 6 9 | 5 2 4
5 2 4 | 8 1 7 | 3 9 6
------ ------- ------
2 8 7 | 9 5 1 | 6 4 3
9 3 1 | 4 8 6 | 2 7 5
4 6 5 | 7 2 3 | 9 1 8
------ ------- ------
7 1 2 | 6 3 8 | 4 5 9
6 5 9 | 1 7 4 | 8 3 2
8 4 3 | 5 9 2 | 1 6 7

Time taken to solve the sudoku (finding all solutions, and exclude time needed to print the board): 0.008952177 seconds.

Are solution(s) valid? 
The only solution is valid.

--------------------
Guessing board 2 from 'sample_unsolved.txt':
Solution 1 found.
Initial board: 
3   2 | 6   9 |     5
5     | 7 3   |      
      |       | 9    
------ ------- ------
      | 9 4   |      
      |       | 1   9
      |   5 7 |   6  
------ ------- ------
    8 | 5     |     6
      |       |     3
  1 9 |   8 2 |   4  

There is 1 solution.
Showing the only solution:
3 8 2 | 6 1 9 | 4 7 5
5 9 4 | 7 3 8 | 6 2 1
1 7 6 | 4 2 5 | 9 3 8
------ ------- ------
8 6 3 | 9 4 1 | 7 5 2
4 5 7 | 2 6 3 | 1 8 9
9 2 1 | 8 5 7 | 3 6 4
------ ------- ------
7 3 8 | 5 9 4 | 2 1 6
2 4 5 | 1 7 6 | 8 9 3
6 1 9 | 3 8 2 | 5 4 7

Time taken to solve the sudoku (finding all solutions, and exclude time needed to print the board): 0.012124095 seconds.

Are solution(s) valid? 
The only solution is valid.

--------------------
Guessing board 3 from 'sample_unsolved.txt':
Solution 1 found.
Initial board: 
      |   7 5 | 4    
      |       |     8
  8   | 1 9   |      
------ ------- ------
3     |     1 |   6  
      |       |   3 4
      |   6 8 | 1 7  
------ ------- ------
2   4 |       | 6   3
9     |       |   2  
5 3   | 2     |      

There is 1 solution.
Showing the only solution:
6 9 3 | 8 7 5 | 4 1 2
1 4 5 | 6 3 2 | 7 9 8
7 8 2 | 1 9 4 | 3 5 6
------ ------- ------
3 5 7 | 4 2 1 | 8 6 9
8 1 6 | 9 5 7 | 2 3 4
4 2 9 | 3 6 8 | 1 7 5
------ ------- ------
2 7 4 | 5 1 9 | 6 8 3
9 6 8 | 7 4 3 | 5 2 1
5 3 1 | 2 8 6 | 9 4 7

Time taken to solve the sudoku (finding all solutions, and exclude time needed to print the board): 0.016209075 seconds.

Are solution(s) valid? 
The only solution is valid.

--------------------
Guessing board 4 from 'sample_unsolved.txt':
Solution 1 found.
Initial board: 
3     |       |      
  5   | 7   3 |     8
      |   2 8 |   7  
------ ------- ------
7     |       |   4 3
      |       |      
    3 | 9   4 | 1   5
------ ------- ------
4     | 3     | 8    
1     |   4   |      
9 6 8 |       | 2    

There is 1 solution.
Showing the only solution:
3 8 7 | 4 1 9 | 5 2 6
2 5 9 | 7 6 3 | 4 1 8
6 4 1 | 5 2 8 | 3 7 9
------ ------- ------
7 1 6 | 2 8 5 | 9 4 3
5 9 4 | 6 3 1 | 7 8 2
8 2 3 | 9 7 4 | 1 6 5
------ ------- ------
4 7 2 | 3 9 6 | 8 5 1
1 3 5 | 8 4 2 | 6 9 7
9 6 8 | 1 5 7 | 2 3 4

Time taken to solve the sudoku (finding all solutions, and exclude time needed to print the board): 0.01498085 seconds.

Are solution(s) valid? 
The only solution is valid.

--------------------
Guessing board 5 from 'sample_unsolved.txt':
Unique solution found. Sudoku solved with basic elimination.
Initial board: 
2 9   | 5     |     7
7     |       | 4    
    4 | 7 3 8 |   1 2
------ ------- ------
9   2 |     3 |   6 4
8     |   5   |   7  
5     |   6 7 | 2    
------ ------- ------
3   9 |     4 |     5
      |   8   | 7    
  8 7 |     5 | 1   9

There is 1 solution.
Showing the only solution:
2 9 3 | 5 4 1 | 6 8 7
7 1 8 | 2 9 6 | 4 5 3
6 5 4 | 7 3 8 | 9 1 2
------ ------- ------
9 7 2 | 8 1 3 | 5 6 4
8 4 6 | 9 5 2 | 3 7 1
5 3 1 | 4 6 7 | 2 9 8
------ ------- ------
3 6 9 | 1 7 4 | 8 2 5
1 2 5 | 3 8 9 | 7 4 6
4 8 7 | 6 2 5 | 1 3 9

Time taken to solve the sudoku (finding all solutions, and exclude time needed to print the board): 0.001481365 seconds.

Are solution(s) valid? 
The only solution is valid.

--------------------
Guessing board 6 from 'sample_unsolved.txt':
Unique solution found. Sudoku solved with basic elimination.
Initial board: 
  8   |   2   |      
  4   | 5     | 3 2  
  2   | 3   9 |   4 6
------ ------- ------
6     |   9   |     4
      | 6 4   | 5   1
1 3 4 |   5   | 7    
------ ------- ------
3 6   |     4 |     2
4   7 | 2 3   | 6    
      | 7     | 4 5  

There is 1 solution.
Showing the only solution:
7 8 3 | 4 2 6 | 9 1 5
9 4 6 | 5 1 8 | 3 2 7
5 2 1 | 3 7 9 | 8 4 6
------ ------- ------
6 5 8 | 1 9 7 | 2 3 4
2 7 9 | 6 4 3 | 5 8 1
1 3 4 | 8 5 2 | 7 6 9
------ ------- ------
3 6 5 | 9 8 4 | 1 7 2
4 1 7 | 2 3 5 | 6 9 8
8 9 2 | 7 6 1 | 4 5 3

Time taken to solve the sudoku (finding all solutions, and exclude time needed to print the board): 0.001443075 seconds.

Are solution(s) valid? 
The only solution is valid.

--------------------
Guessing board 7 from 'sample_unsolved.txt':
Unique solution found. Sudoku solved with basic elimination.
Initial board: 
6   8 | 7 3   |      
2     |       | 4 6  
      |   6 4 | 8 2  
------ ------- ------
  8   |     5 | 7   1
9     | 6 1 8 |     4
  3 1 |       |   8  
------ ------- ------
8 6   | 2     |   3 9
  5   |       | 1    
1     | 4 5 6 | 2    

There is 1 solution.
Showing the only solution:
6 4 8 | 7 3 2 | 9 1 5
2 7 5 | 1 8 9 | 4 6 3
3 1 9 | 5 6 4 | 8 2 7
------ ------- ------
4 8 6 | 3 2 5 | 7 9 1
9 2 7 | 6 1 8 | 3 5 4
5 3 1 | 9 4 7 | 6 8 2
------ ------- ------
8 6 4 | 2 7 1 | 5 3 9
7 5 2 | 8 9 3 | 1 4 6
1 9 3 | 4 5 6 | 2 7 8

Time taken to solve the sudoku (finding all solutions, and exclude time needed to print the board): 0.001585682 seconds.

Are solution(s) valid? 
The only solution is valid.

--------------------
Guessing board 8 from 'sample_unsolved.txt':
Unique solution found. Sudoku solved with basic elimination.
Initial board: 
3 7   |       |     1
      | 7     |     5
4   8 |   6 1 |   9  
------ ------- ------
      |   1   |      
  5   |   9   | 4 6  
  8 6 |     2 |   3  
------ ------- ------
      |       |      
6 9 4 |     5 | 2   3
8     | 1 4 9 | 5    

There is 1 solution.
Showing the only solution:
3 7 5 | 9 8 4 | 6 2 1
1 6 9 | 7 2 3 | 8 4 5
4 2 8 | 5 6 1 | 3 9 7
------ ------- ------
9 4 3 | 6 1 8 | 7 5 2
2 5 1 | 3 9 7 | 4 6 8
7 8 6 | 4 5 2 | 1 3 9
------ ------- ------
5 1 7 | 2 3 6 | 9 8 4
6 9 4 | 8 7 5 | 2 1 3
8 3 2 | 1 4 9 | 5 7 6

Time taken to solve the sudoku (finding all solutions, and exclude time needed to print the board): 0.001992338 seconds.

Are solution(s) valid? 
The only solution is valid.

--------------------
Guessing board 9 from 'sample_unsolved.txt':
Solution 1 found.
Initial board: 
  3   | 5     | 8   4
5   4 | 2     |   1  
    8 |     9 |      
------ ------- ------
7 9   | 8   6 | 1   3
      |     5 | 4    
  5   |       |     7
------ ------- ------
8     |       | 7   2
      | 7   4 | 6    
6 1   | 3     | 5    

There is 1 solution.
Showing the only solution:
2 3 9 | 5 1 7 | 8 6 4
5 7 4 | 2 6 8 | 3 1 9
1 6 8 | 4 3 9 | 2 7 5
------ ------- ------
7 9 2 | 8 4 6 | 1 5 3
3 8 1 | 9 7 5 | 4 2 6
4 5 6 | 1 2 3 | 9 8 7
------ ------- ------
8 4 3 | 6 5 1 | 7 9 2
9 2 5 | 7 8 4 | 6 3 1
6 1 7 | 3 9 2 | 5 4 8

Time taken to solve the sudoku (finding all solutions, and exclude time needed to print the board): 0.011588858 seconds.

Are solution(s) valid? 
The only solution is valid.

--------------------
Guessing board 10 from 'sample_unsolved.txt':
Solution 1 found.
Initial board: 
      | 6 8 9 | 1    
8     |       |   2 9
1 5   |       |     8
------ ------- ------
4   3 |       |   5  
2     |     5 |      
  9   | 2 4   | 8   1
------ ------- ------
  8 4 | 7     | 9 1  
5     |       |   6  
  6   | 4 1   |      

There is 1 solution.
Showing the only solution:
7 3 2 | 6 8 9 | 1 4 5
8 4 6 | 5 7 1 | 3 2 9
1 5 9 | 3 2 4 | 6 7 8
------ ------- ------
4 1 3 | 9 6 8 | 2 5 7
2 7 8 | 1 3 5 | 4 9 6
6 9 5 | 2 4 7 | 8 3 1
------ ------- ------
3 8 4 | 7 5 6 | 9 1 2
5 2 1 | 8 9 3 | 7 6 4
9 6 7 | 4 1 2 | 5 8 3

Time taken to solve the sudoku (finding all solutions, and exclude time needed to print the board): 0.005631293 seconds.

Are solution(s) valid? 
The only solution is valid.
=end