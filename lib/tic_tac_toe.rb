class TicTacToe
    WIN_COMBINATIONS = [
         [0,1,2], # Top row
         [3,4,5],
         [6,7,8],
         [0,3,6],
         [1,4,7],
         [2,5,8],
         [0,4,8],
         [6,4,2]  # Middle row
        ]
    def initialize(board = nil)
        @board = Array.new(9, " ")
    end

    def display_board
        puts " #{@board[0]} | #{@board[1]} | #{@board[2]} "
        puts "-----------"
        puts " #{@board[3]} | #{@board[4]} | #{@board[5]} "
        puts "-----------"
        puts " #{@board[6]} | #{@board[7]} | #{@board[8]} "
      end

    def input_to_index(usermove)
        usermove.to_i - 1
        # To convert the user input into an integer we have to define a method to help us do that. We would use the .to_i method to change strings (which are what user inputs are) into integers, then minus 1 because the array counts up to 8, not 9.
    end

    def move(index, token)
        # index = self.input_to_index
        # token = "X" || "O"
        @board[index] = token
    end

   def position_taken?(index)
    !(@board[index].nil? || @board[index] == " ")
    # exclamation point returned it false otherwise true
    # checks index values of move because it is after input_to_index
   end
    
    # def position_taken?(index)
    #     if (board[index] == " ") || (board[index] == "") || (board[index] == nil)
    #         return false 
    #     else
    #         return true
    #     end
    # 
    # def valid_move?(index)
    #     if index.between?(0,8) && !position_taken?(@board, index)
    #        return true
    #     end
    # end
    def valid_move?(index)
        if position_taken?(index) == true
          false
        elsif index.between?(0, 8) && position_taken?(index) == false
          true
        end
    end


    def turn_count
       @board.count{|token| token == "X" || token == "O"}
    end

    def current_player
        turn_count % 2 == 0 ? "X" : "O"
         
    end

    def turn
        puts "Please enter 1-9:"
        input = gets.strip
        index = input_to_index(input)

        if valid_move?(index)
            move(index, token = current_player)
        else    
            turn
        end
        display_board
    end

    # def won?
    #     WIN_COMBINATIONS.each do |win_combination|
    #       win_index_1 = win_combination[0]
    #       win_index_2 = win_combination[1]
    #       win_index_3 = win_combination[2]   
    #       position_1 = [win_index_1] # value of board at win_index_1
    #       position_2 = [win_index_2] # value of board at win_index_2
    #       position_3 = [win_index_3] # value of board at win_index_3   position_1 == position_2 && position_2 == position_3 && position_taken?(board, win_index_1)
    #     end
    # end
    def won?
        WIN_COMBINATIONS.detect do |winning_combos|
          winning_combos.all?{|x| @board[x] == "X"} ||
          winning_combos.all?{|x| @board[x] == "O"}
        end
    end

    def full?
        @board.all? {|i| i == "X" || i == "O"}
    end

    def draw?
        # if !won? && full?
        #     true
        # elsif !won? && !full?
        #     false
        # else won?
        #     false
        # end
        !won? && full? ? true : false
    end

    def over?
        draw? || won? || full? ? true : false
    end

    def winner
        # if won?
        #     return [won?(board)[0]
        # end
        won_g = won?
        won_g ? @board[won_g[0]] : nil
    end
    def play
        until over? 
            turn
        end
        if won?
            winner
            puts "Congratulations #{winner}!"
        elsif 
            draw?
            puts "Cat's Game!"
        end
    end
end