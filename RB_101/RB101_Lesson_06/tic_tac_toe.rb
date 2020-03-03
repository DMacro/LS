require 'pry'

INITIAL_MARKER = ' '
PLAYER_MARKER = 'X'
COMPUTER_MARKER = 'O'


def prompt(text)
  puts "=>#{text}"
end

def joinor(array, delim = ', ', word)
  case array.size
  when 0 then ''
  when 1 then array[0]
  when 2 then "#{array.first} or #{array.last}"
  else 
  array[-1] = "#{word} #{array[-1]}"
              array.join(delim)
  end
end


# rubocop:disable Metrics/AbcSize
def display_board(brd)
  system 'clear'
  prompt "Player is X | Computer is O"
  puts ""
  puts "     |     |"
  puts "  #{brd[1]}  |  #{brd[2]}  |  #{brd[3]}"
  puts "     |     |"
  puts "-----+-----+-----"
  puts "     |     |"
  puts "  #{brd[4]}  |  #{brd[5]}  |  #{brd[6]}"
  puts "     |     |"
  puts "-----+-----+-----"
  puts "     |     |"
  puts "  #{brd[7]}  |  #{brd[8]}  |  #{brd[9]}"
  puts "     |     |"
  puts ""
end
# rubocop:enable Metrics/AbcSize
def initalise_board
  new_board = {}
  (1..9).each { |num| new_board[num] = INITIAL_MARKER}
  new_board
end

def empty_squares(brd)
  brd.keys.select { |num| brd[num] == INITIAL_MARKER}
end

def player_places_piece!(brd)
  square = ''
  
    loop do
      prompt "Choose a square (#{joinor(empty_squares(brd),', ','or')}):"
      square = gets.chomp.to_i
      break if empty_squares(brd).include?(square)
      prompt "Sorry that is not a valid choice"
    end
  brd[square] = PLAYER_MARKER
end

def board_full?(brd)
  empty_squares(brd).empty?
end

def someone_won?(brd)
  !!detect_winner(brd)
end

def detect_winner(brd)
  winning_lines = [[1,2,3],[4,5,6],[7,8,9]] +
                  [[1,5,9],[3,5,7],[1,4,7]] +
                  [[2,5,8],[3,6,9]]

winning_lines.each do |line|
    if  brd[line[0]] == PLAYER_MARKER &&
        brd[line[1]] == PLAYER_MARKER &&
        brd[line[2]] == PLAYER_MARKER
      return 'Player'
    elsif brd[line[0]] == COMPUTER_MARKER &&
          brd[line[1]] == COMPUTER_MARKER &&
          brd[line[2]] == COMPUTER_MARKER
      return 'Computer'
    end
  end
  nil
end

def computer_places_piece!(brd)
  square = empty_squares(brd).sample
  brd[square] = COMPUTER_MARKER

end

def update_score(winner,score)
  
  score[0] += 1 if winner == 'Player' 
  score[1] += 1 if winner == 'Computer'
  
  score

end

def game_over?(score)
  if score[0] == 5
  prompt "Game over! Player is the Winner!"
  score[0] = 0
  score[1] = 0
  end
  if score[1] == 5
    prompt "Game over! Computer is the Winner!"
    score[0] = 0
    score[1] = 0
  end
end

score = [0,0] # [player score, computer score]

loop do
  board = initalise_board
  loop do
    display_board(board)
    player_places_piece!(board)
    break if someone_won?(board) || board_full?(board)
    computer_places_piece!(board)
    display_board(board)
    break if someone_won?(board) || board_full?(board)
  end
  display_board(board)
  if someone_won?(board)
    prompt "#{detect_winner(board)} won!"
    update_score(detect_winner(board),score)
  else
    prompt "It's a tie!"
  end

  
  prompt"The score is Player #{score.first} : #{score.last} Computer"
  game_over?(score)
  
  prompt "Play again? (y or n)"
  anwser = gets.chomp
  break unless anwser.downcase.start_with?('y')
end

prompt "Thanks for playing Xs and Os"
