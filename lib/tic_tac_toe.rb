require 'pry'

class TicTacToe

def initialize(board = nil)
  @board = board || Array.new(9, " ")
end

WIN_COMBINATIONS =[
  [0,1,2],
  [3,4,5],
  [6,7,8],
  [0,4,8],
  [2,4,6],
  [1,4,7],
  [0,3,6],
  [2,5,8]
]

def display_board
  puts " #{@board[0]} | #{@board[1]} | #{@board[2]} "
   puts "-----------"
   puts " #{@board[3]} | #{@board[4]} | #{@board[5]} "
   puts "-----------"
   puts " #{@board[6]} | #{@board[7]} | #{@board[8]} "
 end

 def input_to_index(input)
   @player_input = "#{input}".to_i - 1
 end

 def move(input, token = "X")
   @board[input] = token
 end

 def position_taken?(index)
   if @board[index] == "X" || @board[index] == "O"
     true
   else
     false
   end
  end
#  binding.pry

  def valid_move?(index)
    if index == (0...9)
      true
    elsif @board[index] == " "
      true
    else
      false
    end
  end

  def turn_count
    counter = 0
    @board.each do |index|
      counter += 1 if index != " "
    end
    counter
  end

  def current_player
    if turn_count == 0
      return "X"
    elsif turn_count.even? == true
      return "X"
    else
      return "O"
    end
  end

  def turn
    puts "Please enter 1-9"
     position = gets
    index = input_to_index(position)
    token = current_player
    if valid_move?(index) == true
      move(index, token)
      display_board
    else
      puts "try again"
    end
  end




end
