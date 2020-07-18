class TicTacToe
  
    WIN_COMBINATIONS = [
      [0,1,2],
      [3,4,5],
      [6,7,8],
      [0,4,8],
      [2,4,6],
      [0,3,6],
      [1,4,7],
      [2,5,8]
      ]
  
    def initialize(board=nil)
      @board = board || Array.new(9, " ")
    end 
  
    def display_board
      puts " #{@board[0]} | #{@board[1]} | #{@board[2]} "
      puts "-----------"
      puts " #{@board[3]} | #{@board[4]} | #{@board[5]} "
      puts "-----------"
      puts " #{@board[6]} | #{@board[7]} | #{@board[8]} "
    end

    def input_to_index(input)
      input.to_i - 1
    end 
    
    def move(index,token="X")
      @board[index] = token
    end
     
    def position_taken?(index)
      @board[index]=="X" || @board[index] == "O" 
    end 
  
    def valid_move?(index)
      !position_taken?(index) && index.between?(0,8) 
    end 
    
    def turn
       puts "Please choose between 1 - 9:"
      input = gets.chomp
      index = input_to_index(input)

      if valid_move?(index)
          token = current_player
          move(index,token)
         else 
          turn
         end 
      display_board
    end
    
    def turn_count
      @board.count{|current_player| current_player != " "}
    end
   
    def current_player
      turn_count.even? ? "X" : "O"
    end 
    
    def won?
      WIN_COMBINATIONS.detect do |single_win_combo|
        @board[single_win_combo[0]] == @board[single_win_combo[1]] && @board[single_win_combo[1]] == @board[single_win_combo[2]] && position_taken?(single_win_combo[1])
     end
    end 

    def full?
      @board.all? {|index| index == "X" || index == "O"}
    end

    def draw?
     full? && !won? 
    end 
 
    def over?
     won? || draw? 
    end 
    
    def winner
     if winning_arr = won?
      @board[winning_arr[1]]
      end
    end
    
 
    def play 
      turn until over?
      if winner 
        puts "Congratulations #{winner}!"
      else 
        puts "Cat's Game!"
    end 
  end 
end