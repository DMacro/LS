ABBREVS = { rock: 'r',
  paper: 'p',
  scissors: 's',
  spock: 'sp',
  lizard: 'l' }.freeze

VALID_CHOICES = ABBREVS.flatten.map(&:to_s).freeze
MOVE_BEATS = { rock: %w(scissors lizard),
     paper: %w(rock spock),
     scissors: %w(paper lizard),
     spock: %w(scissors rock),
     lizard: %w(spock paper) }.freeze

END_ABBREVS = { yes: 'y',
      no: 'n' }.freeze

END_OPTIONS = END_ABBREVS.flatten.map(&:to_s).freeze
WIN_NUMBER = 5

def prompt(message)
Kernel.puts("=> #{message}")
end

def win?(first, second)
MOVE_BEATS[first].include?(second.to_s)
end

def convert(input)
if ABBREVS.values.include?(input)
ABBREVS.key(input)
else
input.to_sym
end
end

def answer
choice = ''
loop do
prompt("To play, choose one: #{ABBREVS.keys.join(', ')}")
prompt("Or you can use an abbreviation: #{ABBREVS.values.join(', ')}")
choice = Kernel.gets.chomp.downcase

break if VALID_CHOICES.include?(choice)
prompt("Sorry, but that's not a valid choice.")
end
convert(choice)
end

def display_results(player, computer)
if win?(player.to_sym, computer)
prompt('You won this match!')
elsif win?(computer.to_sym, player)
prompt('Computer won this match!')
else
prompt("It's a tie")
end
end

def increment_score(player, computer, score)
if win?(player.to_sym, computer)
score[0] += 1
elsif win?(computer.to_sym, player)
score[1] += 1
else
  score[0] += 0.5
  score[1] += 0.5
end
end

def win_condition?(win_count)
win_count.include?(WIN_NUMBER)
end

def play_again?
loop do
prompt("Do you want to play again? Choose: #{END_ABBREVS.keys.join(', ')}")
prompt("Or you can also enter: #{END_ABBREVS.values.join(', ')}")
response = Kernel.gets.chomp.downcase
return response if END_OPTIONS.include?(response)
prompt("Sorry, but that's not a valid choice.")
end
end

def end_game?(end_game_response)
end_game_response == 'no' || end_game_response == 'n'
end

def clear
system('clear') || system('cls')
end

loop do
clear
choice = ''
player_computer_score = [0, 0] # player score 1st; computer score 2nd
prompt('Welcome to Rock Paper Scissors Spock Lizard!')
prompt("The grand winner is the first person to win #{WIN_NUMBER} matches.")

loop do
choice = answer

computer_choice = convert(VALID_CHOICES.sample)

Kernel.puts("You chose: #{choice}; Computer chose: #{computer_choice}")

display_results(choice, computer_choice)

increment_score(choice, computer_choice, player_computer_score)

prompt("Your Score: #{player_computer_score[0]}.")
prompt("Computer's Score: #{player_computer_score[1]}.")

break if win_condition?(player_computer_score)
end

if player_computer_score[0] == WIN_NUMBER
prompt('Congratulations on being the grand winner of the game!')
else
prompt('Defeat! The computer is the grand winner of the game.')
end

play_again_response = play_again?

break if end_game?(play_again_response)
end

prompt('Thanks for playing. Goodbye!')