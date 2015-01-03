#1.draw a board first
#  player assign with "X"
#  computer assign with "O" 
#2.player pick a square(position)
#3.computer pick a square(position)
#4.check who is winner,if there is no winner or no empty square,loop the game
#5.if there is a winner,end the loop

def initialize_board
  board = {}
  (1..9).each {|position| board[position] = " "}
  board
end

def empty_positions(board)
  board.keys.select {|position| board[position] == " "}
end

def player_place_pices(board)
  begin
    puts "Please place a pieces.Type 1 - 9"
    position = gets.chomp.to_i
  end until empty_positions(board).include?(position)
  board[position] = "X"
end

def computer_place_pices(board)
  position = empty_positions(board).sample
  board[position] = "O"
end

def check_winner(board) 
  winner_lines = [[1,2,3],[4,5,6],[7,8,9],[1,4,7],[2,5,8],[3,6,9],[1,5,9],[3,5,7]]
  winner_lines.each do |line|
    return "Player" if board.values_at(*line).count("X") === 3
    return "Computer" if board.values_at(*line).count("O") ===3
  end
  nil
end

def nine_positions_are_filled?(board)
  empty_positions(board) == []
end
  
def annouce_winner(winner)
  puts "#{winner} won!"
end

def draw_board(board)
  system "clear"
  puts
  puts "     |     | "
  puts "  #{board[1]}  |  #{board[2]}  |  #{board[3]}"
  puts "     |     | "
  puts "-----+-----+----"
  puts "  #{board[4]}  |  #{board[5]}  |  #{board[6]}"
  puts "-----+-----+----"
  puts "     |     | "
  puts "  #{board[7]}  |  #{board[8]}  |  #{board[9]}"
  puts "     |     | "
  puts
end

board = initialize_board
draw_board(board)
begin
  player_place_pices(board)
  draw_board(board)
  computer_place_pices(board)
  draw_board(board)
  winner = check_winner(board)
end until winner || nine_positions_are_filled?(board) 

if winner
  annouce_winner(winner)
else
  puts "It's a tie."
end