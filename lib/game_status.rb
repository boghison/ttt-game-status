# Helper Method
def position_taken?(board, index)
  !(board[index].nil? || board[index] == " ")
end

# Define your WIN_COMBINATIONS constant
WIN_COMBINATIONS = [
  [0,1,2], # Top row
  [3,4,5],  # Middle row
  [6,7,8], # Bottom row
  [0,3,6], # First column
  [1,4,7], # Middle column
  [2,5,8], # Last column
  [0,4,8], # Diagonal
  [2,4,6] # Diagonal
] 

def won?(board)
  WIN_COMBINATIONS.each do |combo|
    pos_0 = board[combo[0]]
    pos_1 = board[combo[1]]
    pos_2 = board[combo[2]]

    if (pos_0 == "X" && pos_1 == "X" && pos_2 == "X") || (pos_0 == "O" && pos_1 == "O" && pos_2 == "O")
      return combo
    end
  end
  nil
end

def full?(board)
  board.reject{|pos| pos == "X" || pos == "O"} == []
end

def draw?(board)
  full?(board) && !won?(board)
end

def over?(board)
  won?(board) || draw?(board)
end

def winner(board)
  combo = won?(board)
  if combo == nil then return nil end
  board[combo[0]]
end