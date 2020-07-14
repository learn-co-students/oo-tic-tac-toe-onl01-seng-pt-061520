require "pry"

class TicTacToe
    WIN_COMBINATIONS = [[0,1,2],[3,4,5],[6,7,8],[0,3,6],[1,4,7],[2,5,8],[0,4,8],[2,4,6]]

    def initialize
      @board = [" "," "," "," "," "," "," "," "," "]
    end

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

      def move(index, token)
        @board[index] = token
      end

      def position_taken?(input)
        @board[input] != " "
      end

      def valid_move?(move)
        move.between?(0,8) && @board[move] == " "
      end

      def turn
        puts "Please enter 1-9:"
        choice = gets.chomp
        index = input_to_index(choice)
        if valid_move?(index)
          move(index, current_player)
          display_board
        else
          turn
        end
      end

      def turn_count
        @board.count {|token| token == "X" || token == "O"}
      end

      def current_player
        turn_count % 2 == 0 ? "X" : "O"
      end

      def won?
        WIN_COMBINATIONS.find do |c|
          @board[c[0]] == @board[c[1]] && @board[c[1]] == @board[c[2]] && position_taken?(c[1])
        end
      end

      def full?
        !@board.include?(" ")
      end

      def draw?
        !won? && full?
      end

      def over?
        draw? || won?
      end

      def winner
        if won?
          if current_player == "X"
            return "O"
          else
            return "X"
          end
        end
      end

      def play
          turn until over?
          puts "Congratulations #{winner}!" if won?
          puts "Cat's Game!" if draw?
      end
end