class TicTacToe
  attr_accessor :input
  WIN_COMBINATIONS = [
    #straight across
    [0,1,2], #top row
    [3,4,5], #middle row
    [6,7,8], #bottom row
    #diagonals
    [0,4,8], #top left to bottom right
    [2,4,6], #top right to bottom left
    #columns
    [0,3,6], #left column
    [1,4,7], #middle column
    [2,5,8] #right column
    ]
  
  
  def initialize(board = nil)
    @board = board || Array.new(9, " ")
  end
 
  def current_player
    turn_count % 2 == 0 ? "X" : "O"
  end
 
  def turn_count
    @board.count{|token| token == "X" || token == "O"}
  end
  
  def input_to_index(input)
    input.to_i - 1
  end
  
  def move(index, token = "X")
    @board[index] = token
    #takes in the input of the index of the @board array that the player chooses
    #also takes in the player's token, defaults to "X" if no argument
  end
  
  def position_taken?(index)
    (@board[index] =="X") || (@board[index] == "O")
  end
  
  def valid_move?(index)
    !position_taken?(index) && (index >= 0 && index <= 8)
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
    if (@board[combo[0]]) == "X" && (@board[combo[1]]) == "X" && (@board[combo[2]]) == "X"
      combo
      elsif (@board[combo[0]]) == "O" && (@board[combo[1]]) == "O" && (@board[combo[2]]) == "O"
      combo
    end
  end
end
   

  def full?
   !@board.any? { |x| x == " " }
  end
 
  def draw?
    full? && !won?
  end
  
  def over?
    draw? || won?
  end
  
  def winner
     WIN_COMBINATIONS.detect do |combo|
    if (@board[combo[0]]) == "X" && (@board[combo[1]]) == "X" && (@board[combo[2]]) == "X"
      return "X"
      elsif (@board[combo[0]]) == "O" && (@board[combo[1]]) == "O" && (@board[combo[2]]) == "O"
      return "O"
    end
  end
  end
  
  def play
    until over?
      turn
    end
    if won?
      puts "Congratulations #{winner}!"
    elsif draw?
      puts "Cat's Game!"
    end
  end
  
  def display_board
    puts " #{@board[0]} | #{@board[1]} | #{@board[2]} "
    puts "-----------"
    puts " #{@board[3]} | #{@board[4]} | #{@board[5]} "
    puts "-----------"
    puts " #{@board[6]} | #{@board[7]} | #{@board[8]} "
  end
end