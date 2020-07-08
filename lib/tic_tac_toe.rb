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
     index = 0
     index = input.to_i - 1
   end

   def move(board_position, player_token="X")
     #binding.pry
     @board[board_position] = player_token
   end

   def position_taken?(index)
     #check to see if position is occupied or not (runs after #input_to_index)
     #binding.pry
     @board[index] == "X" || @board[index] == "O" ? true : false
     #return false if position is not taken else true if taken
   end

   def valid_move?(position)
     #accetps a position to check and return true if valid false or nill if not
     # valid_move - present on the game board & not already filled with token
     position.between?(0,8)
     @board[position] == " " ? true : false
   end

   def turn
     over?
     #ask the user for their move by specifying a position between 1-9
     #puts "Choose a postion between 1-9"
     #receive the user's input
     input = gets.strip
     while !input.match?(/[1-9]/)
        #puts "Choose a postion between 1-9"
       input = gets.strip
     end
     #translate that input into an index values
     input = input_to_index(input)
     #if the move is valid, make the move and display the display the board
     #if the move is invalid ask for a new move
     if valid_move?(input)
       move(input, current_player)
       self.display_board
     else
      #puts "Choose a postion between 1-9"
      input = gets.strip
     end
     over?
   end

   def turn_count
     #returns the number of turns that have been played based on the @board var
    @board.count {|token| token == "X" || token == "O"}
   end

   def current_player
     self.turn_count % 2 == 0 ? "X" : "O"
   end

   def won?
     # return false/nill if there is no win combo
     # return winning combo as an array if there is a one
     # use WIN_COMBINATIONS
     winning_array = []
     WIN_COMBINATIONS.each do |num_array|
       if num_array.all? {|num| @board[num] == "X"}
         winning_array = num_array
       elsif num_array.all? {|num| @board[num] == "O"}
         winning_array = num_array
       else
         false
       end
       #binding.pry
     end
     if winning_array.count > 0
       winning_array
     end
   end

   def full?
     # return true if every element in the board contains either "X" or "O"
     @board.all? {|pos| pos == "X" || pos == "O"}
   end

   def draw?
     # returns true if the board is full and has not been won
     # false if the board is won & false if the board is neither won nor full
     if full? && !won?
       true
     elsif !won?
       false
     elsif !won? || !full?
       false
     end
   end

   def over?
     # reutns true if the board has been won or is full, aka draw
     # detect{ |i| @board is full or won } #return true
     won? == true || full? == true ? true : false
   end

   def winner
     # given a winning @board the #winner should return the token "X" or "O"
     # that has won the game
     if won?.kind_of?(Array)
       # binding.pry
       token = ""
       if won?.all? {|i| @board[i] == "X" }
         token = "X"
       elsif won?.all? {|i| @board[i] == "O"}
         token = "O"
       end
     end
   end

   def play
     # until the game is over
     if over? == false
       self.turn
       # binding.pry
     end
     if winner == "X" || winner == "O"
       puts "Congratulations #{winner}!"
     elsif draw? == true
       puts "Cat's Game!"
     end

     #binding.pry
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
