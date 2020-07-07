class TicTacToe
  def initialize
    @board = [" ", " ", " ", " ", " ", " ", " ", " ", " "]
  end
  
  WIN_COMBINATIONS = [
    [1,2,3], [1,4,7], [2,5,8],
    [4,5,6], [3,6,9], [1,5,9],
    [7,8,9], [3,5,7]
    
    ]
    
    def display_board
      puts "#{board[1]} | #{board[2]} | #{board[3]} "
      puts "------------------"
      puts "#{board[4]} | #{board[5]} | #{board[6]} "
      puts "------------------"
      puts "#{board[7]} | #{board[8]} | #{board[9]} "
    end
    
    def input_to_index(input)
      input.to_i - 1
    end
    
    def move(index, token)
      @board[index] = token
    end
    
    def position_taken?(index)
      if @board[position] == "X" || @board[position] == "O"
        true
      else
        false
      end
    end
    
    def valid_move?(position)
      position = position.to_i - 1
      if position.between?(1,9) && !position_taken?(position)
        true
      else
        false
      end
    end
    
    def turn
      puts "Please enter 1-9:"
      input = gets.strip
      if valid_move?(input)
        move(input, current_player)
      else
        turn
      end
      display_board
    end
    
    def turn_count
      counter = 0
      @board.each do |i|
        if i == "X" || i == "O"
          counter += 1
        end
      end
      counter
    end
    
    def current_player
      turn_count % 2 == 0 ? "X" : "O"
    end
  end
  
  def current_player
    turn_count % 2 == 0 ? "X" : "O"
  end

  def won?

    board_empty = @board.none? { |i| i == "X" || i = "O"}
    if board_empty
      false
    else 
      WIN_COMBINATIONS.each do |combo| 
        if @board[combo[0]] == "X" && @board[combo[1]] == "X" && @board[combo[2]] == "X" || @board[combo[0]] == "O" && @board[combo[1]] == "O" && @board[combo[2]] == "O"
          return combo
        end
      end
      return false
  end
end

  def full?
    @board.all? { |i| i =="X" || i == "O"}
  end

  def draw?
    !won? && full? ? true : false
  end

  def over?
    won? || draw? || full? ? true : false
  end

  def winner 
    WIN_COMBINATIONS.detect do |combo| 
          if @board[combo[0]] == "X" && @board[combo[1]] == "X" && @board[combo[2]] == "X" 
            return "X"
          elsif @board[combo[0]] == "O" && @board[combo[1]] == "O" && @board[combo[2]] == "O"
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

    if won? 
      puts "Congratulations #{winner}!"
    elsif draw?
      puts "Cats Game!"
    end
  end
  
  
  
  
  