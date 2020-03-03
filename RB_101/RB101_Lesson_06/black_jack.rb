
require 'pry'

# ASSIGNING THE GLOBAL VARIABLES
TIMER_01 = 0.5
TIMER_02 = 0.75
TIMER_03 = 1.0
TIMER_04 = 1.25

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

# ASSIGNING THE METHODS

# formats varies prompts
def format_type(text, type1)
  code1 = COLOUR_CODE[type1.to_sym]
  puts "\e[#{code1}m#{text}\e[0m"
end

def format_code(type)
  type = type.to_sym
  COLOUR_CODE[type]
end

# returns white text prompt
def prompt(str)
  puts "=> #{str}"
end

# returns underlined text prompt
def statement_prompt(message)
  format_type(message.to_s, 'underline')
end

# returns red text prompt
def warning_prompt(message)
  format_type(message.to_s, 'red')
end

# returns green text prompt
def conversation_prompt(message)
  format_type(message.to_s, 'green')
end

# returns light blue text prompt
def information_prompt(message)
  format_type(message.to_s, 'light_blue')
end

# returns yellow text prompt
def important_prompt(message)
  format_type(message.to_s, 'yellow')
end

# returns red text prompt
def red_card(message)
  format_type(message.to_s, 'red')
end

# returns grey text prompt
def grey_card(message)
  format_type(message.to_s, 'grey')
end

# returns green text prompt
def green_card(message)
  format_type(message.to_s, 'green')
end

# coverts suit string into it's assoicated icon
def return_suit(str)
  case str
  when 'H' then  0x2661.chr('UTF-8')
  when 'D' then  0x2662.chr('UTF-8')
  when 'S' then  0x2664.chr('UTF-8')
  when 'C' then  0x2667.chr('UTF-8')
  end
end

def line_space
  puts ""
end

# converts card value and suit into graphic
def display_card(value, suit)
  return grey_card ("╔═════╗\n║#{value} #{suit} ║\n╚═════╝") if value.to_i > 9 && (suit == '♤' || suit == '♧')
  return red_card ("╔═════╗\n║#{value} #{suit} ║\n╚═════╝") if value.to_i > 9 && (suit == '♢' || suit == '♡')
  return grey_card ("╔═════╗\n║ #{value} #{suit} ║\n╚═════╝") if value.to_i < 10 && (suit == '♤' || suit == '♧')
  return red_card ("╔═════╗\n║ #{value} #{suit} ║\n╚═════╝") if value.to_i < 10 && (suit == '♢' || suit == '♡')
end

def show_facedown_card
  return green_card ("╔═════╗\n║ $$$ ║\n╚═════╝")
end

# returns card graphic for entire hand
def show_cards (cards)
  cards.each do |card|
    display_card(card[1], return_suit(card[0]))
  end
end

# assigns a random card to hand and removes from deck. Add new deck if deck is depeleted
def deal_card!(dck, hand)
  card = []
  card = dck.sample
  hand << card
  dck.delete(card)
end

# calculadealtes the hand value
def calc_hand_value(cards)
  values = cards.map { |card| card[1] }
  sum = 0
  values.each do |value|
    if value == 'A'
      sum += 11
    elsif value.to_i == 0 # not 2-10 and Ace
      sum += 10
    else
      sum += value.to_i
    end
  end
  # Correction for Aces
  values.select { |value| value == 'A' }.count.times do
    sum -= 10 if sum > 21
  end
  sum
end

def divider
  puts""
  puts"------------------------------------------------------------------------"
  puts""
end

def hit_or_stay(decision)
  decision.downcase == 'h' || decision.downcase == 's'
end

def who_won?(player, dealer, cnt, value)
  if player == value
    important_prompt "Congradulations. YOU HIT #{value}! You Won!"
    cnt[0] += 1
  elsif player > value
    warning_prompt "Hard Luck. Your busted. Dealer Won!"
    cnt[2] += 1
  elsif player > dealer
    warning_prompt "Congradulations. You Won!"
    cnt[0] += 1
  elsif dealer > value
    warning_prompt "Congradulations. Dealer is bust. You Won!"
    cnt[0] += 1
  elsif dealer > player
    warning_prompt "Hard Luck. Dealer Won! Better luck next Time!"
    cnt[2] += 1
  else
    warning_prompt "It's a tie!"
    cnt[1] += 1
  end
end

def valid_number?(num)
  num.to_i.to_s == num
end


def load_deck(suit,val)
  suit.product(val) 
end

def opening_top (val)
  system 'clear' # clear screen
  if val == 1
    statement_prompt "BLACKJACK - PLAYER?"
  elsif val == 2
    statement_prompt "BLACKJACK - GAME VALUE?"
  else val == 3
    statement_prompt "BLACKJACK - DEALER VALUE?"  
  end
  line_space
end

# PROGRAM SEQUENCE

# LOAD DECK AND PLAYERS NAME
game_defaults = [17, 21]
SUITS = %w(H D S C) # sort suits
VALUES = %w(2 3 4 5 6 7 8 9 10 J Q K A) # sort values
players_name = "" # initlaise players name
deck = load_deck(SUITS, VALUES)
score = [0,0,0] # player,tie,dealer 
game_value = ""
dealer_hit_value = ""


opening_top (1)
prompt "To begin, please you enter your name"
players_name = gets.chomp

opening_top (2)
prompt "Hello #{players_name.capitalize}. The GAME VALUE is normally 21."
line_space
prompt "That is the sum of the cards you are trying to reach is 21."
line_space
prompt "However, we can play upto a value of your choice!!!"
line_space
prompt "Please enter a value. [Or hit enter to default value at 21]"

loop do
  game_value = gets.chomp

  if game_value == ""
    game_value = game_defaults[1].to_s
  end
  if valid_number?(game_value)
    game_value = game_value.to_i
    break
  else
    puts "Please enter a valid number"
  end
end

opening_top (3)
prompt "Please enter value what you wish the DEALER STAY VALUE to stop at." 
line_space
prompt "[or hit enter to default value of 17]"
line_space
prompt "Note: This needs to be less or equal to the game value #{game_value}."
loop do
  dealer_hit_value = gets.chomp
  
  if dealer_hit_value == ""
    dealer_hit_value = game_defaults[0].to_s
  end
  if valid_number?(dealer_hit_value) && dealer_hit_value.to_i <= game_value
    dealer_hit_value = dealer_hit_value.to_i
    break
  else
    prompt "Please enter a valid number. Less or equal to #{game_value}"
  end
end
# RUN INTRO SEQUENCE

system 'clear'
sleep(TIMER_03)
puts "Loading....."
system 'clear'
statement_prompt "#{game_value}'s / BLACKJACK"
sleep(TIMER_03)
line_space
puts "Welcome #{players_name.capitalize} to the card game #{game_value}\'s also called BLACKJACK."
sleep(TIMER_03)
line_space
puts'We hope you enjoy the game and best of luck!!!'
sleep(TIMER_03)
line_space
puts"Values of hand are shown beside name; for example #{players_name.upcase} (#{game_value})."
line_space
puts"New decks are automatically loaded. So keep on playing as long as you wish."
sleep(TIMER_03)
5.times{line_space}
green_card  "╔═╔═╔═╔═╔═╔═╔═╔═╔═╔═╔═╔═╔═╔═╔═╔═╔═╔═╔═╔═╔═╔═╔═╔═╔═╔═╔═╔═╔═╔═╔═╔═╔═╔═╔═╔═╔═╔═╔═╔═╔═╔═╔═╔═╔═╔═╔═╔═╔═╔═╔═╔═════╗"
green_card  "║ ║ ║ ║ ║ ║ ║ ║ ║ ║ ║ ║ ║ ║ ║ ║ ║ ║ ║ ║ ║ ║ ║ ║ ║ ║ ║ ║ ║ ║ ║ ║ ║ ║ ║ ║ ║ ║ ║ ║ ║ ║ ║ ║ ║ ║ ║ ║ ║ ║ ║ ║ $$$ ║"
green_card  "╚═╚═╚═╚═╚═╚═╚═╚═╚═╚═╚═╚═╚═╚═╚═╚═╚═╚═╚═╚═╚═╚═╚═╚═╚═╚═╚═╚═╚═╚═╚═╚═╚═╚═╚═╚═╚═╚═╚═╚═╚═╚═╚═╚═╚═╚═╚═╚═╚═╚═╚═╚═════╝"
line_space
conversation_prompt'The Dealer is shuffling the deck.....'
3.times { sleep(TIMER_04) }

loop do # start / restart game
  system 'clear'
  # INITILAISE VARIABLES AND REDUCE DECK (ON REPLAY)
  players_hand = []
  players_value = 0
  dealers_hand = []
  dealers_hidden_card = []
  dealers_value = 0
  # initial_deal
  deck = load_deck(SUITS, VALUES) if deck.count == 0
  deal_card!(deck, players_hand) # player
  deck = load_deck(SUITS, VALUES) if deck.count == 0
  deal_card!(deck, dealers_hand) # dealer
  deck = load_deck(SUITS, VALUES) if deck.count == 0
  deal_card!(deck, players_hand) # player
  deck = load_deck(SUITS, VALUES) if deck.count == 0
  deal_card!(deck, dealers_hidden_card) # dealer
  
  loop do # the player's hand
    line_space
    players_value = calc_hand_value(players_hand)
    dealers_value = calc_hand_value(dealers_hand)
    statement_prompt "#{players_name.upcase} (HAND VALUE: #{players_value})"
    show_cards(players_hand)
    divider
    statement_prompt "THE DEALERS HAND (HAND VALUE: #{dealers_value})"
    show_cards(dealers_hand)
    show_facedown_card
    divider
    statement_prompt "GAME INFORMATION (Cards Left: #{deck.count})"
    line_space
    conversation_prompt "Games Won: #{score[0]}. Games Lost: #{score[2]}. Games Tied: #{score[1]}"
    line_space
    break unless players_value < game_value
    conversation_prompt "Would you like to (h)it or (s)tay?"
    player_decision = ''
    loop do
      player_decision = gets.chomp
      break if hit_or_stay(player_decision)
      information_prompt "Please enter h for hit or s for stay!"
    end
    system 'clear'
    break if player_decision.downcase == 's' || players_value >= game_value
    deck = load_deck(SUITS, VALUES) if deck.count == 0
    deal_card!(deck, players_hand)
  end
  dealers_hand << dealers_hidden_card[0] # dd hidden card to dealers hand
  loop do
    break unless players_value < game_value
    system 'clear'
    statement_prompt "#{players_name.upcase} (#{players_value})"
    line_space
    show_cards(players_hand)
    divider
    dealers_value = calc_hand_value(dealers_hand)
    statement_prompt "DEALERS HAND (#{dealers_value})"
    line_space
    show_cards(dealers_hand)
    divider
    statement_prompt "GAME INFORMATION (CARDS LEFT: #{deck.count})"
    line_space
    conversation_prompt "Games Won: #{score[0]}. Games Lost: #{score[2]}. Games Tied: #{score[1]}"
    line_space
    break if dealers_value >= dealer_hit_value
    sleep(TIMER_04)
    deck = load_deck(SUITS, VALUES) if deck.count == 0
    deal_card!(deck, dealers_hand,)
  end
  
  who_won?(players_value, dealers_value, score, game_value)
  line_space
  conversation_prompt "Press enter to replay or 'q' plus enter to quit"
  answer = gets.chomp
  break if answer.downcase == 'q'
end

system 'clear'
statement_prompt "RESULTS"
divider
conversation_prompt "#{players_name.upcase} WINS = #{score[0]}"
line_space
conversation_prompt "GAME TIED = #{score[1]}"
line_space
conversation_prompt "DEALER WINS = #{score[2]}"
line_space
important_prompt "Thank you #{players_name.capitalize} for playing. We hope to see you again soon! Goodbye."
