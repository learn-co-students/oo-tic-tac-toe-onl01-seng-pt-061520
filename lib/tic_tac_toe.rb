class TicTacToe

  def initialize
    @board = [" " ," " ," " ," " ," " ," " ," " ," " ," " ]
  end

  WIN_COMBINATIONS = [0,1,2,], [3,4,5], [6,7,8], [0,3,6], [1,4,7], [2,5,8], [6,4,2], [0,4,8]


  def display_board
    puts " #{@board[0]} | #{@board[1]} | #{@board[2]} "
    puts " ----------- "
    puts " #{@board[3]} | #{@board[4]} | #{@board[5]} "
    puts " ----------- "
    puts " #{@board[6]} | #{@board[7]} | #{@board[8]} "
  end

  def move(i, token= "X" )
     @board[i] = token
  end

  def input_to_index(input)
    input.to_i - 1
  end

  def position_taken?(i)
  #  if @board[i] = "X" || "O"
  #     return true
  #   else
  #     false
  #  end
  if  @board[i] != " "
    true
  else
    false
  end
end

  def valid_move?(i)
    if position_taken?(i) == false && i.between?(0,8)
      return true
    else
      false
    end
  end

  def turn_count
  @board.count{|spot| spot != " "}
  end

  def current_player
 turn_count.even? ? "X" : "O"
  end

  def turn
       puts "Input a number (1-9):"
       input = gets.strip
       i = input_to_index(input)
       if valid_move?(i)

         move(i, current_player)
       else
         turn
       end
       display_board
     end

     def won?
     WIN_COMBINATIONS.any? do |combo|
       if position_taken?(combo[0]) && @board[combo[0]] == @board[combo[1]] && @board[combo[1]] == @board[combo[2]]
         return combo
       end
     end
   end

   def full?
     @board.all?{|box| box != " " }
   end

   def draw?
     full? && !won?
   end

   def over?
     won? || draw?
   end

   def winner
     if combo = won?
       @board[combo[0]]
     end
   end

   def play
     turn until over?
     puts winner ? "Congratulations #{winner}!" : "Cat's Game!"
   end
 end
