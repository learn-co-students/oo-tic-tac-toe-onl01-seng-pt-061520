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
   @board[index] == "X" || @board[index] == "O"
  end
#  binding.pry

  def valid_move?(index)
    !position_taken?(index) && index.between?(0,8)
  end


  def turn_count
    counter = 0
    @board.each do |index|
      counter += 1 if index != " "
    end
    counter
  end

  def current_player
    if turn_count.even?
      return "X"
    else
      return "O"
    end
  end

  def turn
    puts "Please enter a number (1-9):"
    user_input = gets.strip
    index = input_to_index(user_input)
    if valid_move?(index)
      token = current_player
      move(index, token)
    else
      turn
    end
    display_board
  end

  def won?
    WIN_COMBINATIONS.detect do |array|
      @board[array[0]] == @board[array[1]] && @board[array[0]] == @board[array[2]] && position_taken?(array[0])
    end
  end

  def full?
    @board.all? do |space|
      space == "X" || space == "O"
    end
  end

  def draw?
    full? && !won?
  end

  def over?
    draw? || won?
  end

  def winner
    WIN_COMBINATIONS.detect do |array|
      if @board[array[0]] == "X" && @board[array[1]] == "X" && @board [array[2]] == "X"
        return "X"
      elsif @board[array[0]] == "O" && @board[array[1]] == "O" && @board [array[2]] == "O"
        return "O"
      else
        nil
      end
    end
  end

  def play
    until over?
    turn
    end
    # binding.pry
        if won?
        #  binding.pry
          puts "Congratulations #{winner}!"
        elsif draw?
          puts "Cat's Game!"
        end
  end

end
