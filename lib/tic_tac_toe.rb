class TicTacToe
  
 
     
      
WIN_COMBINATIONS = [
  [0,1,2], # Top row
  [3,4,5], # middle row
  [6,7,8], # bottom row
  [0,3,6], #1st column
  [1,4,7], #2nd column
  [2,5,8], #3rd column
  [0,4,8], #diagonal 1
  [2,4,6] #diagonal 2
]

 def current_player
    turn_count % 2 == 0 ? "X" : "O"
  end
 
  def turn_count
    @board.count{|token| token == "X" || token == "O"}
  end
    
   def initialize(board = nil)
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
  
  def move(index, token = "X")
    @board[index] = token
  end
  
  def position_taken?(index)
  ((@board[index] == "X") || (@board[index] == "O"))
  end
  
  def valid_move?(index)
    index.between?(0,8) && !position_taken?(index)
  end
  
  def turn
    puts "Please input a turn"
    input = gets.strip
    index = input_to_index(input)
    player = current_player
    if valid_move?(index)
      move(index, player)
      display_board
    else
      turn
    end
  end
  
  def won?
    WIN_COMBINATIONS.detect do |combo|
      if   (@board[combo[0]]) == "X" && (@board[combo[1]]) == "X" && (@board[combo[2]]) == "X"
         combo
      elsif (@board[combo[0]]) == "O" && (@board[combo[1]]) == "O" && (@board[combo[2]]) == "O"
         combo
      else
         false
       end
      end
     end
     
    def full?
      !@board.any?{|x| x == " "}
    end
    
    def draw?
      !won? && full?
     end
     
     def over?
       won? || draw?
     end
     
    def winner
   WIN_COMBINATIONS.detect do |win_combo|
     if (@board[win_combo[0]]) == "X" && (@board[win_combo[1]]) == "X" && (@board[win_combo[2]]) == "X"
       return "X"
     elsif (@board[win_combo[0]]) == "O" && (@board[win_combo[1]]) == "O" &&   (@board[win_combo[2]]) == "O"
       return "O"
      else
       nil
     end
    end
  end
  
  def play
  while over? == false
    turn
  end
  if won?
    puts "Congratulations #{winner}!"
  elsif draw?
    puts "Cat's Game!"
  end
end
  

end