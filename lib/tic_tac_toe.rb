class TicTacToe

  def initialize(board = [" ", " ", " ", " ", " ", " ", " ", " ", " "])
    @board = board
  end

  def board= (board)
    @board = board
  end

  def board
    @board
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
  puts " #{board[0]} | #{board[1]} | #{board[2]} "
  puts "-----------"
  puts " #{board[3]} | #{board[4]} | #{board[5]} "
  puts "-----------"
  puts " #{board[6]} | #{board[7]} | #{board[8]} "
end

def input_to_index(input)
  input.to_i - 1
end

def move(index, token)
  board[index] = token
  if turn_count.even?
    token = "X"
  elsif turn_count.odd?
    token = "O"
  end
end

def turn_count
  counter = 0
board.each do |turn|
  if turn != " "
  counter += 1
end
end
counter
end

def position_taken?(index)
if board[index] == "X" || board[index] == "O"
true
  else board[index] == "   " || board[index] == " " || board[index] == nil
    false
end
end

def valid_move?(index)
  if index.between?(0,8) && !position_taken?(index)
    true
  else
    nil
  end
end

def current_player
  if turn_count.even?
  "X"
elsif turn_count.odd?
    "O"
  else
    nil
  end
end


def turn
    puts "Please enter 1-9:"
    input = gets.strip
    if turn_count.even?
      token = "X"
    elsif turn_count.odd?
      token = "O"
    end
    index = input_to_index(input)
    if valid_move?(index)
      move(index, token)
      display_board
    else
      turn
    end
end



end
