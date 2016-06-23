
  class TicTacToe


    def initialize(board = nil)
   @board = board || Array.new(9, " ")
    end

    def board
       @board
     end


    WIN_COMBINATIONS = [
      [0,1,2], # Top row
      [3,4,5], # Middle row
      [6,7,8], # Bottom row
      [0,3,6], # column 1
      [1,4,7], # column 2
      [2,5,8], # column 3
      [0,4,8], # diagonal 1
      [2,4,6]  # diagonal 2
    ]


    def display_board
 puts " #{@board[0]} | #{@board[1]} | #{@board[2]} "
 puts "-----------"
 puts " #{@board[3]} | #{@board[4]} | #{@board[5]} "
 puts "-----------"
 puts " #{@board[6]} | #{@board[7]} | #{@board[8]} "
    end

    def move(index,char= "X" )
      @board[index.to_i - 1] = char

    end


    def position_taken?(index)
      !(@board[index].nil? || @board[index] == " " || @board[index] == "" )
    end


    def valid_move?(position)
         position = position.to_i - 1
      if position_taken?(position) == true
          false
          puts "Position is taken. Please re-enter."
     elsif position.between?(0, 8)
          true
      else
        false
      end
    end


    def turn
      puts "Please enter 1-9:"

      integer_input = gets.strip
      position = integer_input.to_i
      if valid_move?(position) == false
        turn
      else
        move( position, current_player)
        display_board
      end

    end


    def turn_count
      turns = 0
          @board.each do |position|
          if position != " "
            turns += 1
        end
      end

      return turns
    end


    #current_player
    def current_player
       if turn_count.even?
         return "X"
       else
         return "O"
      end
    end


    def won?
      WIN_COMBINATIONS.detect do |win|
        @board[win[0]] == @board[win[1]] &&
        @board[win[1]] == @board[win[2]] &&
        position_taken?( win[0])
      end
    end


    def full?
        @board.all? do |position|
        if position == "X" || position == "O"
          true
       else
         false
       end
     end
    end



    def draw?
       if !won? && full?
         true  #draw
      else
        false
     end
    end


    def over?
      if full?  || draw?  || won?
        true
      else
        false
    end
    end


    def winner
       if !won?
          return nil
        else
       return @board[won?[0]]
     end
    end


    def play

      until over?
         turn
      end

    if won?
       puts  "Congratulations #{winner}!"
     elsif draw?
      puts "Cats Game!"
    end
    end







  end
