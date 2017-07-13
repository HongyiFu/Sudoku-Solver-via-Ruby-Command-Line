class SudokuBoardError < ArgumentError; end

class Sudoku
  
  attr_reader :solutions

  # Class constant ARRAY_OF_AFFECTED_INDEXES is at end of file.

  def initialize(board_string)
  	unless board_string.is_a?(String) && board_string.length == 81 && (board_string.chars - ('0'..'9').to_a).empty?
  		raise SudokuBoardError.new('Board must be a string of 81 characters made up of only numbers from 0 to 9 (0 to represent empty cell).')
  	end
    @board_string = board_string  
    @solutions = []  
  end

  	
  def solve!
    @start_time = Time.now
    @initial_board_array = @board_string.chars.map { |e| e == "0" ? " " : e }
    board_array = @initial_board_array.map { |e| e == " " ? ("1".."9").to_a : e }
    if eliminate(board_array) # we only start guessing if elimination did not return false
      guess(board_array)
    end
    @end_time = Time.now
  end
  
  def guess board_array 
    # history is an array to keep track of history of chosen paths.

    # Each of the element in history is an array of length 3.
    #  The 1st element tells us which path are we at
    #    Eg: -1 being we have not reach this cell yet, 0 means we are currently trying the 1st possible number

    #  The 2nd element is the index of the cell on the board.
    #  The 3rd element (last) element is the array of the possible options, which we will revert back to (by duplicating this array) if necessary.

    history = []
    board_array.each_with_index do |e,i| 
      if e.class == Array 
        history << [-1,i,e.dup] 
      end
    end

    length_of_empty_indexes = history.length 
    if length_of_empty_indexes == 0 # it means all cells are filled. Hence this is the only solution.
      @solutions << board_array
      puts "Unique solution found. Sudoku solved with basic elimination."
      return 
    end

    # if its not fully filled, we proceed with code below, the 'trying' part.
    counter = -1    
    last_filled_index = -1
    check_full_board = false

    loop do 

      # The idea:
      #   We increment the counter, plug in a possible number in the next empty cell, then we go to the next loop.
      #   In the next loop, the 1st if-statement will run the eliminate function.
      #   If the function eliminate does not return false, we then increment the counter, and plug in possible number in the next empty cell.
      # If eliminate returns true, it means the path we have chosen has not been determined as false YET.

      # In the first try, we skip eliminating because we have already eliminated before starting the loop.
      # After the first loop iteration, either eliminate or eliminate_previous (partial check) will always run to check if board is valid. 
      
      if counter == -1 || check_full_board ? eliminate(board_array) : eliminate_previous([last_filled_index], board_array)

        # this means we have filled in all empty cells, while eliminate also did not return false, hence its a solution. 
        if counter >= length_of_empty_indexes - 1 
          @solutions << board_array.dup
          puts "Solution #{@solutions.count} found."
          if @solutions.count >= 200
          	puts "200 solutions found thus far. Stopped finding further solutions."
          	return
          end

          counter -= 1
          while history[counter][0] == history[counter][2].length - 1
            board_array[history[counter][1]] = history[counter][2].dup
            counter -= 1
            return if counter == -1
          end

          history[counter][0] += 1
          board_array[history[counter][1]] = history[counter][2][history[counter][0]]
          check_full_board = true

        else
          counter += 1
          
          # While eliminating, some of the empty indexes may have been filled. 
          # If they have been filled, we then move forward the counter.

          while board_array[history[counter][1]].class != Array 
            history[counter][0] = history[counter][2].index(board_array[history[counter][1]]) # We record the path we have taken
            counter += 1
            if counter > length_of_empty_indexes - 1 
              @solutions << board_array.dup 
              puts "Solution #{@solutions.count} found."
         		 	if @solutions.count >= 200
              	puts "200 solutions found thus far. Stopped finding further solutions."
         		 		return 
         		 	end
              counter -= 1 
              while history[counter][0] == history[counter][2].length - 1
                board_array[history[counter][1]] = history[counter][2].dup
                counter -= 1
                return if counter == -1
              end

              history[counter][0] += 1 # try the next possible number
              board_array[history[counter][1]] = history[counter][2][history[counter][0]]
              go_next = true
              check_full_board = true
              break

            end
          end
          next if go_next 

          board_array[history[counter][1]] = board_array[history[counter][1]][0]
          history[counter][0] = history[counter][2].index(board_array[history[counter][1]])
          check_full_board = false 
          last_filled_index = history[counter][1]
        end

      # this is when eliminate returns false, which means the board is invalid, hence we need to try the next possible number
      else 
        while history[counter][0] == history[counter][2].length - 1
          board_array[history[counter][1]] = history[counter][2].dup
          counter -= 1
          return if counter == -1
        end
        history[counter][0] += 1
        board_array[history[counter][1]] = history[counter][2][history[counter][0]]       
        (counter+1).upto(length_of_empty_indexes-1) { |i| board_array[history[i][1]] = history[i][2].dup }
        check_full_board = true 
      end
    end
  end
  
  # Try solving board (without guessing) by examining all squares and eliminating wrong options
  def eliminate board_array

    0.upto(80) do |idx|

      # if cell_number is an array, we then eliminate invalid number by examining affected_indexes (cells that are in either same row, col or box)
      if board_array[idx].class == Array 
    		
        ARRAY_OF_AFFECTED_INDEXES[idx].each do |arr_of_affected_indexes|
          count_of_occurrence_of_one_to_nine = Array.new(9) { 0 }
          arr_of_affected_indexes.each do |i|
            if board_array[i].class == String 
              board_array[idx].delete(board_array[i])
              number = board_array[i].to_i - 1
              count_of_occurrence_of_one_to_nine[number] += 1
              if count_of_occurrence_of_one_to_nine[number] > 1
              	return false 
              end
            end
          end
        end

        if board_array[idx].length == 0
          return false 
        elsif board_array[idx].length == 1
          board_array[idx] = board_array[idx][0]
        	return false if !eliminate_previous([idx], board_array)
        end

      else 
      # Case: cell_number.class == String
      # We check to see if given board is valid.

      	ARRAY_OF_AFFECTED_INDEXES[idx].each do |arr_of_affected_indexes|
          count_of_occurrence_of_one_to_nine = Array.new(9) { 0 }
          count_of_occurrence_of_one_to_nine[board_array[idx].to_i - 1] = 1
          arr_of_affected_indexes.each do |i|
            if board_array[i].class == String 
              number = board_array[i].to_i - 1
              count_of_occurrence_of_one_to_nine[number] += 1
              if count_of_occurrence_of_one_to_nine[number] > 1
              	return false 
              end
            end
          end
        end
      end
	  end
  end

  # if a solution is found for a cell, this method will be called to eliminate that solution as possible solutions for affected cells
  def eliminate_previous roll_back, board_array 
    while roll_back.any?
      roll_back_index = roll_back.delete_at(0)
      ARRAY_OF_AFFECTED_INDEXES[roll_back_index].each do |arr_of_affected_indexes|
        count_of_occurrence_of_one_to_nine = Array.new(9) { 0 }
        count_of_occurrence_of_one_to_nine[board_array[roll_back_index].to_i - 1] = 1
        arr_of_affected_indexes.each do |i|
          if board_array[i].class == String 
            number = board_array[i].to_i - 1
            count_of_occurrence_of_one_to_nine[number] += 1
            if count_of_occurrence_of_one_to_nine[number] > 1
            	return false 
            end
          else
          	board_array[i].delete(board_array[roll_back_index])
          	if board_array[i].length == 1
          		board_array[i] = board_array[i][0]
          		number = board_array[i].to_i - 1
          		count_of_occurrence_of_one_to_nine[number] += 1
            	if count_of_occurrence_of_one_to_nine[number] > 1
	            	return false 
	            end
          		roll_back << i
          	end
          end
        end
      end
    end

    return true

  end

  def display_solution
    puts "Initial board: "
    print_board @initial_board_array

    if @solutions.empty?
      puts "\nThere is no solution. Bad sudoku!"
    else 
      puts "\n#{@solutions.count == 1 ? "There is" : "There are"} #{@solutions.count} #{@solutions.count == 1 ? "solution." : "solutions."}"
      if @solutions.count > 5
        puts "Showing the first 5 solutions (chosen at random):\n"
        @solutions.sample(5).each do |board|
          print_board board 
          puts
        end
      else 
        puts "Showing #{@solutions.count == 1 ? "the only solution" : "all #{@solutions.count} solutions"}:"
        @solutions.each do |board|
          print_board board 
          puts
        end
      end
    end
    puts "Time taken to solve the sudoku (finding all solutions, and exclude time needed to print the board): #{@end_time - @start_time} seconds."
  end

  def self.check_if_solution_is_true board
    # check if each row has 1 to 9
    board.each_slice(9) do |array_of_9|
      return false if (array_of_9 - ('1'..'9').to_a).any?
    end

    # check if each column has 1 to 9
    board.each_slice(9).to_a.transpose do |array_of_9|
      return false if (array_of_9 - ('1'..'9').to_a).any?
    end

    # check if each box has 1 to 9
    [[0,1,2,9,10,11,18,19,20],
    [3,4,5,12,13,14,21,22,23],
    [6,7,8,15,16,17,24,25,26],
    [27,28,29,36,37,38,45,46,47],
    [30,31,32,39,40,41,48,49,50],
    [33,34,35,42,43,44,51,52,53],
    [54,55,56,63,64,65,72,73,74],
    [57,58,59,66,67,68,75,76,77],
    [60,61,62,69,70,71,78,79,80]].each do |box|
      return false if (('1'..'9').to_a - box.map { |i| board[i] }).any?
    end

    return true # if we reach this line, then board is valid
  end

  def check_solutions
    found_any_invalid = false 
    if @solutions.any? 
      @solutions.each_with_index do |solution,i|
        if !Sudoku.check_if_solution_is_true(solution) 
          puts "Solution #{i+1} is invalid."
          found_any_invalid = true 
        end
      end
      puts "#{@solutions.count == 1 ? "The only solution is" : "All #{@solutions.count} solutions are"} valid." unless found_any_invalid
    end
  end

  private
    
  # Find the cells that are 'affected' by the index.
  # 'Affected' means being in the same row or same column or same box.
  def self.find_indexes_within_same_row_col_box idx
    arr_of_indexes_in_same_row = []
    arr_of_indexes_in_same_col = []
    arr_of_indexes_in_same_box = []
    row = idx / 9
    col = idx % 9
    box = determine_box(row, col)

    (0..80).each do |coord|  
      if coord != idx 
        row_of_coord = coord / 9
        col_of_coord = coord % 9 
        box_of_coord = determine_box(row_of_coord, col_of_coord)
        if row == row_of_coord 
          arr_of_indexes_in_same_row << coord 
          if col == col_of_coord 
            arr_of_indexes_in_same_col << coord 
          end
          if box == box_of_coord
            arr_of_indexes_in_same_box << coord
          end
        elsif col == col_of_coord
          arr_of_indexes_in_same_col << coord 
          if box == box_of_coord
            arr_of_indexes_in_same_box << coord
          end
        elsif box == box_of_coord 
          arr_of_indexes_in_same_box << coord 
        end
      end
    end

    [arr_of_indexes_in_same_row, arr_of_indexes_in_same_col, arr_of_indexes_in_same_box]
  end

  # determine which box the index lies at for indexes 0-80
  def self.determine_box row, col
    (row / 3 % 3) * 3 + col / 3 % 3
  end

  # prints a given completed board
  def print_board board
    column = 0
    board.each_slice(9) do |row| 
      str = row.join " "
      str.insert 6,"| "
      str.insert -6, "| "
      puts str
      if column == 2 || column == 5
        dashes = "-" * 21
        dashes[6] = " "
        dashes[14] = " "
        puts dashes 
      end
      column += 1
    end
  end

  public

  ARRAY_OF_AFFECTED_INDEXES = (0..80).map { |i| self.find_indexes_within_same_row_col_box(i) }

end

