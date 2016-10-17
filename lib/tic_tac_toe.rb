class TicTacToe

  def initialize(board = nil)
    @board = Array.new(9, " ")
  end

  WIN_COMBINATIONS = [
    [0, 1, 2],
    [3, 4, 5],
    [6, 7, 8],
    [0, 3, 6],
    [1, 4, 7],
    [2, 5, 8],
    [0, 4, 8],
    [6, 4, 2]
  ]

  def display_board
    puts " #{@board[0]} | #{@board[1]} | #{@board[2]} "
    puts "-----------"
    puts " #{@board[3]} | #{@board[4]} | #{@board[5]} "
    puts "-----------"
    puts " #{@board[6]} | #{@board[7]} | #{@board[8]} "
  end

  def move(position, character)
    @board[position.to_i - 1] = character
  end

  def position_taken?(position)
    return !(@board[position] == " ")
  end

  def valid_move?(position)
    position = position.to_i - 1
    return ((position >= 0 && position <= 8) && !(position_taken?(position)))
  end

  def turn

    puts "Where would you like to go? Input 1-9:"
    position = gets.strip
    if (valid_move?(position)) then
      move(position, current_player)
      display_board
    else
      puts "Input is invalid. Please input 1-9:"
      turn
    end
  end

  def turn_count
    turns = 0
    counter = 0
    while counter < 9 do
      if position_taken?(counter) then turns += 1 end
      counter += 1
    end
    turns
  end

  def current_player
    character = "O"
    if (turn_count % 2 == 0) then character = "X" end
    character
  end

  def won?
    WIN_COMBINATIONS.each do |combo|
      if (position_taken?(combo[0]) && (@board[combo[0]] == @board[combo[1]] && @board[combo[0]] == @board[combo[2]])) then
        return combo
      end
    end

    false
  end

  def full?
    full = true
    counter = 0
    until (counter == 9 || full = false) do
      full = position_taken?(counter)
      counter += 1
    end
    full
  end

  def draw?
    return (full? && !(won?))
  end

  def over?
    return (won? || draw?)
  end

  def winner
    combo = won?
    if (combo != false) then return @board[combo[0]]
    else return nil end
  end

  def play
    until (over?) do
      turn
    end

    if (won?) then puts "Congratulations #{winner}!" end

    if (draw?) then puts "Cats Game!" end 
  end
end
