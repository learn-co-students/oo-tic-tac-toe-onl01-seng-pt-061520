require 'pry'
class TicTacToe

    WIN_COMBINATIONS = [[0,1,2], [3,4,5], [6,7,8], [0,3,6], [1,4,7], [2,5,8], [0,4,8],[2,4,6]]

    def initialize
        @board = Array.new(9, " ")
    end

    def display_board
        puts " #{@board[0]} | #{@board[1]} | #{@board[2]} "
        puts "-----------"
        puts " #{@board[3]} | #{@board[4]} | #{@board[5]} "
        puts "-----------"
        puts " #{@board[6]} | #{@board[7]} | #{@board[8]} "
    end

    def input_to_index(input)
        player_input = input.to_i 
        index_number = player_input - 1
    end

    def move(index, token = "X")
        @board[index] = token
    end

    def position_taken?(index)
        if @board[index] == " " || @board[index] == "" || @board[index] == nil
         false 
        elsif @board[index] == "X" || "O"
        true 
      end
    end

    def valid_move?(index)
        index.between?(0,8) && !position_taken?(index)
    end

    def turn
        puts "Please enter 1-9."
        input = gets.strip
        index = input_to_index(input)
        token = current_player
        if valid_move?(index)
            move(index, token)
        
        else
           input = gets.strip
        end
        display_board
    end

    def turn_count
        @board.count{|token| token =="X" || token == "O"}
    end

    def current_player
        turn_count % 2 == 0 ? "X" : "O"
    end

    def won?
        WIN_COMBINATIONS.find do |combo|
            win_index_1 = combo[0]
            win_index_2 = combo[1]
            win_index_3 = combo[2]
            
            pos_1 = @board[win_index_1]
            pos_2 = @board[win_index_2]
            pos_3 = @board[win_index_3]

            (pos_1 == "X" && pos_2 == "X" && pos_3 == "X") || (pos_1 == "O" && pos_2 == "O" && pos_3 == "O")
             
        end
    end

    def full?
        @board.none? {|index| index == " "}
    end

    def draw?
        !won? && full?
    end

    def over?
        won? || full?
    end

    def winner
      if won?
        @board[won?[0]]
      end
    end

    def play
        until over? do
            turn
        end
        
        if won?
            winner 
        else
            puts "This game ended in a draw!"
        end
    end



end
