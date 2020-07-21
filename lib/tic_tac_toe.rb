class TicTacToe
    def initialize(board = nil)
        @board = board || Array.new(9, " ")
    end
    
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

    WIN_COMBINATIONS = [
        [0,1,2],
        [3,4,5],
        [6,7,8],
        [0,3,6],
        [1,4,7],
        [2,5,8],
        [0,4,8],
        [2,4,6],
    ]

    def input_to_index(user_input)
        user_input.to_i - 1
    end
    
    def move(index, token)
        @board[index] = token
    end

    def position_taken?(index)
        @board[index] == "X" || @board[index] == "O"
    end  

    def valid_move?(index)
        index.between?(0,8) && !position_taken?(index)
    end

    def turn
        print "Please enter a number for 1-9:"
        user_input= gets.strip.to_i
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
        WIN_COMBINATIONS.detect do |combo|
            @board[combo[0]] == @board[combo[1]] &&
            @board[combo[1]] == @board[combo[2]] &&
            position_taken?(combo[0])
        end
    end

    def full?
        counter = 0
        loop do
            if counter == 9
                return true
            end
            if !position_taken?(counter)
                return false
            end
            counter += 1
        end
    end

    def draw?
        if !won? && full?
            return true
        else
            return false
        end
    end

    def over?
        if won?||draw?
            return true
        else
            return false
        end
    end

    def winner
        combo = won?
        if combo
                return @board[combo[0]]
            else
        end
    end

    def play
        until over?
          turn
        end
        
        if won?
        winner == "X" || winner == "0"
        puts "Congratulations #{winner}!"
        else draw?
        puts "Cat's Game!"
        end
    end
end
