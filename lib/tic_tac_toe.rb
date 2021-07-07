require 'pry'
class TicTacToe
    def initialize(board=nil)
      @board=board=Array.new(9," ")
    end
    WIN_COMBINATIONS=[
      [0,1,2],
      [3,4,5],
      [6,7,8],
      [0,3,6],
      [1,4,7],
      [2,5,8],
      [0,4,8],
      [6,4,2]
      ]
      def display_board
        puts " #{@board[0]} | #{@board[1]} | #{@board[2]} "
        puts "-----------"
        puts " #{@board[3]} | #{@board[4]} | #{@board[5]} "
        puts "-----------"
        puts " #{@board[6]} | #{@board[7]} | #{@board[8]} "
    end
    def input_to_index(index)
        index.to_i-1
    end
    def move(index,player="X")
        @board[index] = player
    end
    def position_taken?(index)
        !(@board[index] == " " || @board[index] == "")
    end
    def valid_move?(index)
       index.between?(0,8) && !position_taken?(index)
    end
    def turn_count
        @board.count {|cell| cell=="X"||cell=="O"}
    end
    def current_player
        turn_count % 2==0 ? "X" : "O"
    end
    def turn
        puts "Please enter 1-9:"
        input=gets.strip
        index = input_to_index(input)
         
        if valid_move?(index)
           token=current_player
           move(index,token)
           display_board
        else
          puts "That was invalid try again"
          turn
        end
    end
    def won?
       winner=nil
       
        WIN_COMBINATIONS.each do |combination|
           position_1 = combination[0]
           position_2 = combination[1]
           position_3 = combination[2]
           
           if @board[position_1]=="X" && @board[position_2]=="X" && @board[position_3]=="X"
               
               winner=combination
           
            elsif @board[position_1]=="O" && @board[position_2]=="O" && @board[position_3]=="O"
               
              winner=combination
           end
          
        end
        winner
    end
    def full?
        turn_count ==9
    end
    def draw?
        full? && !won?
    end
    def over?
        won? || draw?
    end
    def winner
        if winner=won?
           @board[winner.first]
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
end