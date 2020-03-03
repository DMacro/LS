
require 'pry'

# ASSIGNING THE GLOBAL VARIABLES
S_1 = 0.5
S_2 = 0.75
S_3 = 1.0
S_4 = 1.25

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
def format_type(text, type1) #formats varies prompts
  code1 = COLOUR_CODE[type1.to_sym]
  puts "\e[#{code1}m#{text}\e[0m"
end

def format_code(type)
  type = type.to_sym
  COLOUR_CODE[type]
end

def prompt(str) #returns white text prompt
  puts "=> #{str}"
end

def statement_prompt(message) #returns underlined text prompt
  format_type("#{message}",'underline')
end

def conversation_prompt(message) #returns green text prompt
  format_type("#{message}",'green')
end

def information_prompt(message) #returns light blue text prompt
  format_type("#{message}",'light_blue')
end

def warning_prompt(message) #returns red text prompt
  format_type("#{message}",'red')
end

def question_prompt(message) #returns yellow text prompt
  format_type("#{message}",'yellow')
end

def red_card(message) #returns red text prompt
  format_type("#{message}",'red')
end

def grey_card(message) #returns grey text prompt
  format_type("#{message}",'grey')
end

def green_card(message) #returns green text prompt
  format_type("#{message}",'green')
end


def return_suit(str) #coverts suit string into it's assoicated icon 
  case str
  when 'H' then suit = 0x2661.chr('UTF-8')
  when 'D' then suit = 0x2662.chr('UTF-8')
  when 'S' then suit = 0x2664.chr('UTF-8')
  when 'C' then suit = 0x2667.chr('UTF-8')
  end
end

def line_space
puts ""
end

def intro_sequence(name)
  system 'clear'
  sleep(S_1)
  statement_prompt "21s / BLACKJACK"
  sleep(S_3)
  line_space
  puts "Welcome #{name.capitalize} to the card game 21\'s also called BLACKJACK."
  sleep(S_3)
  line_space
  puts'We hope you enjoy the game and best of luck!!!'
  sleep(S_3)
  line_space
  puts"Values of hand are shown beside name; for example #{name.upcase} (21)."
  sleep(S_3)
  2.times{line_space}
  green_card  "╔═╔═╔═╔═╔═╔═╔═╔═╔═╔═╔═╔═╔═╔═╔═╔═╔═╔═╔═╔═╔═╔═╔═╔═╔═╔═╔═╔═╔═╔═╔═╔═╔═╔═╔═╔═╔═╔═╔═╔═╔═╔═╔═╔═╔═╔═╔═╔═╔═╔═╔═╔═════╗"
  green_card  "║ ║ ║ ║ ║ ║ ║ ║ ║ ║ ║ ║ ║ ║ ║ ║ ║ ║ ║ ║ ║ ║ ║ ║ ║ ║ ║ ║ ║ ║ ║ ║ ║ ║ ║ ║ ║ ║ ║ ║ ║ ║ ║ ║ ║ ║ ║ ║ ║ ║ ║ ║ $$$ ║"
  green_card  "╚═╚═╚═╚═╚═╚═╚═╚═╚═╚═╚═╚═╚═╚═╚═╚═╚═╚═╚═╚═╚═╚═╚═╚═╚═╚═╚═╚═╚═╚═╚═╚═╚═╚═╚═╚═╚═╚═╚═╚═╚═╚═╚═╚═╚═╚═╚═╚═╚═╚═╚═╚═════╝"
  line_space
  conversation_prompt'The Dealer is shuffling the deck.....'
  3.times{sleep(S_4)}
end

def display_card(value,suit) #converts card value and suit into graphic 
  return grey_card ("╔═════╗\n║#{value} #{suit} ║\n╚═════╝")   if value.to_i > 9 && (suit == '♤' || suit == '♧')
  return red_card ("╔═════╗\n║#{value} #{suit} ║\n╚═════╝")   if value.to_i > 9 && (suit == '♢' || suit == '♡')
  return grey_card ("╔═════╗\n║ #{value} #{suit} ║\n╚═════╝")   if value.to_i < 10 && (suit == '♤' || suit == '♧')
  return red_card ("╔═════╗\n║ #{value} #{suit} ║\n╚═════╝")   if value.to_i < 10 && (suit == '♢' || suit == '♡')
end

def show_facedown_card
  return green_card ("╔═════╗\n║ $$$ ║\n╚═════╝")
end

def show_cards (cards) #returns card graphic for entire hand
  cards.each do |card| 
    display_card(card[1],return_suit(card[0]))
  end
end

def deal_card! (dck,hand,ndck) # assigns a random card to hand
  dck = ndck if dck.count([]) == 52
  card =[]
  loop do
    card = dck.sample
    break if card != []
  end
  hand << card
  dck.each_with_index do |value,index|
    if value == card
      dck[index] = [] 
    end
  end
end

def calc_hand_value (cards) # calcualtes the hand value
  values = cards.map { |card| card[1] }
  sum = 0
  values.each do |value|
    if value == 'A'
      sum += 11
    elsif value.to_i == 0 #not 2-10 and Ace
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
  puts"------------------------------------------------------------------------------------------------------------"
  puts""
end


def who_won? (player,dealer)
  if player == 21
    return warning_prompt "Congradulations. YOU HIT 21! You Won!"
  elsif player > 21
    return warning_prompt "Hard Luck. Your busted. Dealer Won!"
  elsif player > dealer
    return warning_prompt"Congradulations. You Won!" 
  elsif dealer > 21
    return warning_prompt"Congradulations. Dealer is bust. You Won!" 
  elsif dealer > player
    return warning_prompt"Hard Luck. Dealer Won! Better luck next time!" 
  else
    return warning_prompt "It's a tie!"
  end
  sleep(S_3)
end


def player_hand_info(ply)
end


# PROGRAM SEQUENCE

# LOAD DECK AND PLAYERS NAME
suits = %w(H D S C) #sort suits
values = %w(2 3 4 5 6 7 8 9 10 J Q K A) #sort values
players_name = "" # initlaise players name
deck = suits.product(values) #sort deck
system 'clear' #clear screen
question_prompt"Before we start please you enter your name..."
players_name = gets.chomp
new_deck = deck.clone


# RUN INTRO SEQUENCE

intro_sequence(players_name) #introduces players to game

loop do # start / restart game

    system 'clear'
    # INITILAISE VARIABLES AND REDUCE DECK (ON REPLAY)
    players_hand = [] 
    players_value = 0
    dealers_hand = []
    dealers_hidden_card = []
    dealers_value = 0
        
    # initial_deal
    deal_card!(deck,players_hand,new_deck) #player
    deal_card!(deck,dealers_hand,new_deck) #dealer
    deal_card!(deck,players_hand,new_deck) #player
    deal_card!(deck,dealers_hidden_card,new_deck) #dealer
      loop do # the player's hand
        line_space
        players_value = calc_hand_value(players_hand)
        dealers_value = calc_hand_value(dealers_hand)
        statement_prompt "#{players_name.upcase} (#{players_value})"
        show_cards (players_hand)
        divider 
        statement_prompt "THE DEALERS HAND (#{dealers_value})"
        show_cards (dealers_hand)
        show_facedown_card
        divider
        statement_prompt "GAME INFORMATION (Remaining in Deck: #{deck.count()-deck.count([])})"
        line_space
        break unless players_value < 21
        conversation_prompt "Would you like to (h)it or (s)tay?"
        player_decision = ''
          loop do
            player_decision = gets.chomp
            break if player_decision.downcase == 'h' || player_decision.downcase == 's'
            information_prompt "Please enter h for hit or s for stay!"
          end
      
        system 'clear'
        break if player_decision.downcase  == 's' || players_value >= 21
        deal_card!(deck,players_hand,new_deck)
      end
      dealers_hand << dealers_hidden_card[0] #add hidden card to dealers hand 

      loop do
        break unless players_value < 21
          system 'clear'
          statement_prompt "#{players_name.upcase} (#{players_value})"
          line_space
          show_cards (players_hand)
          divider
          dealers_value = calc_hand_value(dealers_hand)
          statement_prompt "DEALERS HAND (#{dealers_value})"
          line_space
          show_cards (dealers_hand)
          divider
          statement_prompt "GAME INFORMATION (Remaining in Deck: #{deck.count()-deck.count([])})"
          line_space
        
        break if dealers_value >= 17
          sleep(S_4)
          deal_card!(deck,dealers_hand,new_deck)

      end

    who_won?(players_value, dealers_value)
    line_space
    conversation_prompt "Would you like to play again? (y or n)"
    answer = gets.chomp
    break if answer.downcase != 'y'
  end

conversation_prompt "Thank you for playing. I hope it was enjoyable!"
