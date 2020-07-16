class TicTacToe
  
  # def initialize
  #   @board = []
    
  #   9.times do
  #     @board << " "
  #   end
    
  # end
  
  def initialize(board = nil)
    @board = board || Array.new(9, " ")
  end
  
    WIN_COMBINATIONS = [
      [0,1,2], [3,4,5], [6,7,8],
      [0,3,6], [1,4,7], [2,5,8],
      [0,4,8], [2,4,6]
      ]
  
  def display_board
    #@board.each do |board|
    #  puts "#{board}"
    #end
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
    @board[index] != " "
  end
  
  def valid_move?(index)
    !position_taken?(index) && index.between?(0,8)
  end
  
  def turn
    puts "Please eneter a number from (1-9):"
    input = gets.strip
    index = input_to_index(input)
    if valid_move?(index)
      token = current_player
      move(index, token)
    else
      turn
    end
    display_board
  end
  
  def turn_count
    @board.count {|num_of_turns| num_of_turns != " "}
  end
  
  def current_player
    turn_count.even? ? "X" : "O"
  end
  
  def won?
    WIN_COMBINATIONS.any? do |match|
      if position_taken?(match[0]) && @board[match[0]] == @board[match[1]] && @board[match[1]] == @board[match[2]]
        return match
      end
    end
  end
  
  def full?
    @board.all?{|each_element| each_element != " "}
  end
  
  def draw?
    full? && !won?
  end
  
  def over?
    won? || draw?
  end
  
  def winner
    if match = won?
      @board[match[0]]
    end
  end
  
  def play 
    turn until over?
    puts winner ? "Congratulations #{winner}!" : "Cat's Game!"
  end
end 