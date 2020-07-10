class TicTacToe
  def initialize(board = nil)
    @board = board || Array.new(9, " ")
    @@array = []
  end
  WIN_COMBINATIONS = [
  [0,1,2],
  [3,4,5],
  [6,7,8],
  [0,3,6],
  [1,4,7],
  [2,5,8],
  [0,4,8],
  [2,4,6]
  ]
 
  def current_player
    turn_count % 2 == 0 ? "X" : "O"
  end
 
  def turn_count
    @board.count{|token| token == "X" || token == "O"}
  end
 
  def display_board
    puts " #{@board[0]} | #{@board[1]} | #{@board[2]} "
    puts "-----------"
    puts " #{@board[3]} | #{@board[4]} | #{@board[5]} "
    puts "-----------"
    puts " #{@board[6]} | #{@board[7]} | #{@board[8]} "
  end
  
  def input_to_index(input)
    @board[input.to_i - 1]
    input.to_i - 1
  end 
  
  def move(x, z)
    @board[x] = z
  end 
  
  def position_taken?(position)
    if @board[position] == "X"
      true
    elsif @board[position] == "O"
    true
    else 
      false
    end
  end 
  
  def valid_move?(x)
     x.between?(0,8) && !position_taken?(x)
  end
  
  def turn
    input = gets.strip
    num = input_to_index(input)
    if valid_move?(num)
      move(num, current_player)
      display_board
    else
      turn
    end
  end
  
  def won?
    new_array = []
    WIN_COMBINATIONS.each do |nums|
      if @board[nums[0]] == "X" && @board[nums[1]] == "X" && @board[nums[2]] == "X"
        new_array << nums[0]
        new_array << nums[1] 
        new_array << nums[2]
      elsif @board[nums[0]] == "O" && @board[nums[1]] == "O" && @board[nums[2]] == "O"
        new_array << nums[0] 
        new_array << nums[1]
        new_array << nums[2]
      else 
        false
      end
    end
    if new_array[1] == "X"
      @@array << "X"
    elsif new_array[1] == "O"
      @@array << "O"
    else
    end
    if new_array.size > 0
      new_array
    else
      false
    end
  end 
  
  def full?
    answer = false
    @board.each do |space|
      if space == "X"
      answer = true
      elsif space == "O"
      answer = true
      elsif space = ""
        answer = false
      end
    end
    answer
  end
  
  def draw?
    if full? && !won?
      true
    else
      false
    end
  end
  
  def over?
    if draw?
      true
    elsif won?
      true
    else
      false
    end
  end
  
  def winner
    if won?
      if current_player == "X"
        "O"
        elsif current_player == "O"
        "X"
      else
      end
    else 
      nil
    end
  end 
  
  def play
    until over?
    current_player
    turn
    end
    if won?
      puts "Congratulations #{winner}!"
    elsif draw?
      puts "Cat's Game!"
    else
    end
  end
end