require 'pry'

class TicTacToe 
  
  def initialize(board = nil)
    @board = board || Array.new(9," ")
  end 
    
  WIN_COMBINATIONS = [[0,1,2],[3,4,5],[6,7,8],[0,3,6], [1,4,7], [2,5,8], [0,4,8], [2,4,6]]
  
  
  def display_board
    i = 0 
    while i < 9
      puts " #{@board[i]} | #{@board[i+1]} | #{@board[i + 2]} "
      if i <= 6 
        puts "-----------"
      end 
      i += 3
    end
  end 
  
  def input_to_index(space)
    space = space.to_i 
    space -= 1 
    space 
  end 
  
  def move(index, token)
    @board[index] = token 
  end 
  
  def position_taken?(index)
    @board[index] == " " ? false : true 
  end 
  
  def valid_move?(index)
    if !position_taken?(index) && 0 <= index && index <= 8 
      return true 
    end 
    return false 
  end 
  
  def turn_count
    counter = 0 
    @board.each do |space| 
      if space != " "
        counter += 1 
      end 
    end 
    counter 
  end 
  
  def current_player 
    if turn_count % 2 == 0 
      return "X"
    end 
    return "O"
  end 
  
  def turn
    space = gets.strip
    a = input_to_index(space)
    if valid_move?(a)
      move(a,current_player)
      display_board
    else
      puts "Not a valid move, try again."
      turn 
    end 
  end 
  
  def won? 
    WIN_COMBINATIONS.each do |winner|
      a = ""
      b = 1
      winner.each do |space|
        if a == ""
          a = @board[space]
        else 
          if a == @board[space] && @board[space] != " "
            b +=1 
          end 
        end 
      end 
      if b == 3 
        return winner 
      end 
    end 
    return false 
  end 
  
  def full? 
    @board.each do |space| 
      if space == " "
        return false 
      end 
    end 
    return true 
  end 
  
  def draw?
    if won? || !full?
      return false 
    elsif full? && !won?
      return true 
    end 
  end 
  
  def over?
    if won? || draw?
      return true 
    elsif !full?
      return false 
    end 
  end 
  
  def winner 
    if !won?
      return nil 
    elsif @board[won?[0]] == 'X'
      return 'X'
    elsif @board[won?[0]] == 'O'
      return 'O'
    end 
  end 
    
  def play 
    while !over? 
      turn 
    end 
    if won? != false  
      puts "Congratulations #{winner}!"
    else
        puts "Cat's Game!"
    end
  end 
  
  
  
  
  
end 

# binding.pry
