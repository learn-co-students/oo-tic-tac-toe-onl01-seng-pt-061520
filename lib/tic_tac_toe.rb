require 'pry'

class TicTacToe
    def initialize(board = nil)
        @board = board || Array.new(9, " ")
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

    def move(position, character)
        @board[position] = character
    end

    def position_taken?(index)
        !(@board[index].nil? || @board[index] == " ")
    end

    def valid_move?(index)
        index.between?(0,8) && !position_taken?(index)
    end

    def turn_count
        @board.count{|character| character == "X" || character == "O"}
    end

    def current_player
        turn_count % 2 == 0 ? "X" : "O"
    end


    def turn
        input = gets.chomp
        index = input_to_index(input)
        character = current_player
        if valid_move?(index)
          move(index, character)
          display_board
        else
          turn
        end
    
    end

    def won?
        WIN_COMBINATIONS.detect do |winner|
            if (@board[winner[0]]) == "X" && (@board[winner[1]]) == "X" && (@board[winner[2]]) == "X"
              return winner
            elsif (@board[winner[0]]) == "O" && (@board[winner[1]]) == "O" && (@board[winner[2]]) == "O"
              return winner
            else
              false
            end
        end
    end

    def full?
        @board.all?{|full| full != " "}
    end

    def draw?
        !(won?) && (full?)
    end 

    def over?
        won? || draw?
    end 

    def winner
        if won?
          @board[won?[1]] == "X" ? "X" : "O"
        else
          nil
        end
    end
    
    def play
        while over? == false
          turn
        end
        if won?
          puts "Congratulations #{winner}!"
        else draw?
          puts "Cat's Game!"
        end
    end
 

end

