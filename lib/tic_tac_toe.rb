require "pry"
class TicTacToe

  def initialize(board = nil)
    @board = board || Array.new(9, " ")
  end

  # = nested array filled with the index values of winning combinations
  WIN_COMBINATIONS = [
    [0,1,2], #top row
    [3,4,5], #middle row
    [6,7,8], #bottom row
    [0,3,6], #left column
    [1,4,7], #middle column
    [2,5,8], #right column
    [0,4,8], #left diagonal
    [2,4,6] #right diagonal
  ]

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

   def move(board_position, player_token)
     #binding.pry
     @board[board_position] = player_token
   end

   def position_taken?(index)
     #check to see if position is occupied or not (runs after #input_to_index)
     #binding.pry
     @board[index] == "X" || @board[index] == "O"
     #return false if position is not taken else true if taken
   end

   def valid_move?(position)
     #accetps a position to check and return true if valid false or nill if not
     # valid_move - present on the game board & not already filled with token
     position.between?(0,8) && !position_taken?(position)
   end

   def turn
     #ask the user for their move by specifying a position between 1-9
     #puts "Choose a postion between 1-9"
     #receive the user's input
     input = gets.strip
     #translate that input into an index values
     index = input_to_index(input)
     #if the move is valid, make the move and display the display the board
     #if the move is invalid ask for a new move
     if valid_move?(index)
       move(index, current_player)
       self.display_board
     else
      #if invalid re-run method
      self.turn
     end
   end

   def turn_count
     #returns the number of turns that have been played based on the @board var
    @board.count {|token| token == "X" || token == "O"}
   end

   def current_player
     self.turn_count.even? ? "X" : "O"
   end

   def won?
     # return false/nill if there is no win combo
     # return winning combo as an array if there is a one
     # use WIN_COMBINATIONS
     WIN_COMBINATIONS.detect do |num_array|
       @board[num_array[0]] == @board[num_array[1]] && @board[num_array[1]] == @board[num_array[2]] && position_taken?(num_array[1])
       #binding.pry
     end
   end

   def full?
     # return true if every element in the board contains either "X" or "O"
     @board.all? {|pos| pos == "X" || pos == "O"}
   end

   def draw?
     # returns true if the board is full and has not been won
     # false if the board is won & false if the board is neither won nor full
     full? && !won?
   end

   def over?
     # reutns true if the board has been won or is full, aka draw
     # detect{ |i| @board is full or won } #return true
     won? || draw?
   end

   def winner
     # given a winning @board the #winner should return the token "X" or "O"
     # that has won the game
     if winning_array = won?
       # binding.pry
       @board[winning_array[1]]
     end
   end

   def play
     # until the game is over
     self.turn until over?
     # binding.pry
     if winner
       puts "Congratulations #{winner}!"
     else
       puts "Cat's Game!"
     end
     #   take turns
     # end
     #
     # if the game was won
     #   congratulate the winner
     # else if the game was a draw
     #   tell the players it ended in a draw
     # end
   end
end
