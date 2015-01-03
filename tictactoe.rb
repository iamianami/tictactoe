#1.draw a board first
#  player assign with "X"
#  computer assign with "O" 
#2.player pick a square(position)
#3.computer pick a square(position)
#4.check who is winner,if there is no winner or no empty square,loop the game
#5.if there is a winner,end the loop


def initialize_board
  board = {}                                     #board is a empty hash 
  (1..9).each {|position| board[position] = " "}
  board                                          #will return a hash out
end

def empty_pices(board) #is the "board" in parameter meas the "board" from the "board = initialize_board"?
  board.keys.select {|position| board[position] == " " }  #return an array.
end

def player_place_pices(board) #is the "board" in parameter meas the "board" from the "board = initialize_board"?
  begin
    puts "Please choose a empty sapce which you want,(1-9)"
    position = gets.chomp.to_i
  end until empty_pices(board).include?(position)  
    board[position] = "X"
end
################Try to figure it out#################
# def two_in_row(position,mark)
#   winner_line = [[1,2,3],[4,5,6],[7,8,9],[1,4,7],[2,5,8],[3,6,9],[1,5,9],[3,5,7]]
#   winner_line.each do |line|
#     if line.each.include?(mark) == 2
#       position = 
# end
###############Try to figure it out###################

def computer_place_pices(board) #is the "board" in parameter meas the "board" from the "board = initialize_board"?
  position = empty_pices(board).sample
  board[position] = "O"
end

def draw_board(board) #is the "board" in parameter meas the "board" from the "board = initialize_board"?
  system "clear"
  puts " #{board[1]} | #{board[2]} | #{board[3]} "
  puts "---+---+---"
  puts " #{board[4]} | #{board[5]} | #{board[6]} "
  puts "---+---+---"
  puts " #{board[7]} | #{board[8]} | #{board[9]} "

end

def check_winner(board) #is the "board" in parameter meas the "board" from the "board = initialize_board"?
  winner_line = [[1,2,3],[4,5,6],[7,8,9],[1,4,7],[2,5,8],[3,6,9],[1,5,9],[3,5,7]]
  winner_line.each do |line| 
    return "player" if board.values_at(*line).count('X') == 3  #means that when the winner line have 3 "X"?
    return "computer" if board.values_at(*line).count('O') == 3
  end
  nil
end

def all_pices_filled(board) #is the "board" in parameter meas the "board" from the "board = initialize_board"?
  empty_pices(board) == []
end

def annouce_winner(winner) 
  puts "#{winner} won!"
end



loop do
  board = initialize_board
  draw_board(board)
  begin
    player_place_pices(board)
    draw_board(board)
    computer_place_pices(board)
    draw_board(board)
    winner = check_winner(board)
  end until winner || all_pices_filled(board)

  if winner
   annouce_winner(winner)
  else
    puts "it's tie!"
  end

  puts "Want to play again?  (Y/N)"
  answer = gets.chomp.downcase
  break if answer == "n"
end

