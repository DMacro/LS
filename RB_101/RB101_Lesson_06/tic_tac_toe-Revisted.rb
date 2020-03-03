require 'pry'

# ASSIGNING THE GLOBAL VARIABLES

WINNING_CONDITIONS =  [[1,2,3],[4,5,6],[7,8,9]] +
[[1,4,7],[2,5,8],[3,6,9]] +
[[1,5,9],[3,5,7]]

COLOUR_CODE = {
  red: 31,
  green: 32,
  yellow: 33,
  blue: 34,
  pink: 35,
  light_blue: 36,
  bold: 1,
  black: 30,
  grey: 2,
  italic: 3,
  underline: 4,
  clear: 0
}
PLAYER_MARKER = 'X'
COMPUTER_MARKER = 'O'
INITIAL_MARKER = ' '

# ASSIGNING THE METHODS

def prompt(message)
  format_type("=> #{message}", '', 'clear')
end

def question_prompt(message)
  format_type("=> #{message}", '', 'yellow')
end

def warning_prompt(message)
  format_type("=> #{message}", 'bold', 'red')
end

def information_prompt(message)
  format_type("=> #{message}", '', 'light_blue')
end

def important_prompt(message)
  format_type("#{message}", '', 'yellow')
end

def calc_prompt(message)
  format_type("#{message}", '', 'green')
  new_board[num] = INITIAL_MARKER
def prompt(msg)
  puts "=> #{msg}"
end
def joinor(array, delim = ', ', word = 'or')
  
  case array.size
  when 0 then ''
  when 1 then array[0]
  when 2 then "#{array.first} or #{array.last}"
  else 
    array[-1] = "#{word} #{array[-1]}"
    array.join(delim)
  end
end


def format_code(type)
  type = type.to_sym
  COLOUR_CODE[type]
end

def format_type(text, type1='clear', type2='clear')
  new_board[num] = INITIAL_MARKER

hearts =  0x2661.chr('UTF-8')

warning_prompt(hearts)

def display_board(brd)
  important_prompt "You're a #{PLAYER_MARKER}. Computer is #{COMPUTER_MARKER}"
  calc_prompt "     |     |   "
  calc_prompt "  #{brd[1]}  |  #{brd[2]}  |  #{brd[3]}"
  calc_prompt "     |     |   "
  calc_prompt "-----+-----+-----"
  calc_prompt "     |     |   "
  calc_prompt "  #{brd[4]}  |  #{brd[5]}  |  #{brd[6]}"
  calc_prompt "     |     |   "
  calc_prompt "-----+-----+-----"
  calc_prompt "     |     |   "
  calc_prompt "  #{brd[7]}  |  #{brd[8]}  |  #{brd[9]}"
  calc_prompt "     |     |   "
  calc_prompt ""
end

# This runs with a hash as the parameter.

def initial_board 
  new_board = {}
  (1..9).each do |num|
    new_board[num] = INITIAL_MARKER
  end
  new_board
end
# The initial_board is set to a hash of 1-9 being blank string.

def empty_squares(brd)
  brd.keys.select {|num| brd[num] == INITIAL_MARKER}
end


def player_places_piece!(brd)
  square = ''
  loop do
    prompt "Choose a square: #{joinor(empty_squares(brd),', ','or')}"
    square = gets.chomp.to_i
    break if empty_squares(brd).include?(square) #Iterate and select the keys that return an empty string and return true if input is same as key.
    prompt "Sorry, that is not a valid choice"
  end
  brd[square] = PLAYER_MARKER
end

def board_full?(brd)
  empty_squares(brd).empty?
end

def someone_won?(brd)
  !!detect_winner(brd) ## the bang bang symbol turns string into true nil into false (booleanises).
end

def detect_winner(brd)
  
  WINNING_CONDITIONS.each do |line|
    # if  brd[line[0]] == PLAYER_MARKER && 
    #   brd[line[1]] == PLAYER_MARKER &&
    #   brd[line[2]] == PLAYER_MARKER
    #   return 'Player' 
    # elsif brd[line[0]] == COMPUTER_MARKER && 
    #   brd[line[1]] == COMPUTER_MARKER &&
    #   brd[line[2]] == COMPUTER_MARKER
    #   return 'Computer' 
    if brd.values_at(*line).count(PLAYER_MARKER) == 3
      return 'Player'
    elsif brd.values_at(*line).count(COMPUTER_MARKER) == 3
      return 'Computer'
    end
  end
  nil
end

def computer_places_piece!(brd)
  square = nil
  
  WINNING_CONDITIONS.each do |line|
      square = find_at_risk_square(line,brd,COMPUTER_MARKER)
      break if square
  end
  
  if !square
    WINNING_CONDITIONS.each do |line|
      square = find_at_risk_square(line, brd,PLAYER_MARKER)
      break if square
    end
  end
    
  if brd[5] == ' '
    square = 5
  end

  if !square
  square = empty_squares(brd).sample
  end
  brd[square] = COMPUTER_MARKER
end

def find_at_risk_square(line, board,marker)
  if board.values_at(*line).count(marker) == 2
    board.select{|k,v| line.include?(k) && v == INITIAL_MARKER}.keys.first
  else
    nil
  end
end

def update_score(score,winner)
  score[0] += 1 if winner == 'Player'
  score[1] += 1 if winner == 'Computer'
end

def reset_score(score)
  score[0] = 0
  score[1] = 0
end

def valid_integer?(value)
  value.to_i.to_s == value

end


loop do
  game_limit = 0
  score = [0,0] #set score as an array [player, computer]
  prompt "set the game limit"
  loop do
    game_limit = gets.chomp
    break if valid_integer?(game_limit)
    prompt 'Please choose a valid number'
  end

  game_limit = game_limit.to_i
  
  loop do  
    board = initial_board # sets the board variable to the hash
    
    loop do
      display_board(board)
      player_places_piece!(board)
      break if someone_won?(board) || board_full?(board)
      computer_places_piece!(board)
      break if someone_won?(board) || board_full?(board)
      
    end

    display_board(board)
    
    prompt "It's upto #{game_limit}"

    if someone_won?(board)
      information_prompt "#{detect_winner(board)} won!"
      else
      information_prompt "It's a tie!"
    end
  
    update_score(score,detect_winner(board))

    prompt "Player [#{score[0]}] : Computer [#{score[1]}]"
    
      break if score[0] == game_limit || score[1] == game_limit
      
  end


  warning_prompt "Play again? (y or n)"
  answer = gets.chomp
  break unless answer.downcase.start_with?('y')
end

information_prompt("Thank you for playing. Goodbye.")