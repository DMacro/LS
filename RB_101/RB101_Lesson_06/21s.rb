require 'pry'

# ASSIGNING THE GLOBAL VARIABLES


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

def prompt(message)
  format_type("=> #{message}", '', 'clear')
end

def red_text(message)
  format_type("#{message}",'red')
end

def grey_text(message)
  format_type("#{message}",'grey')
end


def format_code(type)
  type = type.to_sym
  COLOUR_CODE[type]
end

def format_type(text, type1)
  code1 = format_code(type1)
  puts "\e[#{code1}m#{text}\e[0m"
end

hearts =  0x2661.chr('UTF-8')



# 1. Initialize deck
# 2. Deal cards to player and dealer
# 3. Player turn: hit or stay
#   - repeat until bust or "stay"
# 4. If player bust, dealer wins.
# 5. Dealer turn: hit or stay
#   - repeat until total >= 17
# 6. If dealer bust, player wins.
# 7. Compare cards and declare winner.

deck = {:Hearts=>[],:Diamonds=>[],:Clubs=>[],:Spades=>[]}
suits = ['2','3','4','5','6','7','8','9','10','Jk','Qn','Kg','Ace']

deck.each {|key,_| }

 # U+2664, U+2661, U+2662, U+2667

hearts =  0x2661.chr('UTF-8')
diamonds = 0x2662.chr('UTF-8')
spades = 0x2664.chr('UTF-8')
clubs = 0x2667.chr('UTF-8')  


def large_card(value,suit)
    grey_text ("╔═══╗\n║#{value} #{suit} ║\n╚═══╝")
end

def showcard (cards) 
  cards.each do |card| 
    case card [0]
    when 'H' then suit =  0x2661.chr('UTF-8')
    when 'D' then suit = 0x2662.chr('UTF-8')
    when 'S' then suit = 0x2664.chr('UTF-8')
    when 'C' then suit = 0x2667.chr('UTF-8')
    end
    large_card(card[1],suit)
  end
  #binding.pry
  #if card[1].to_i < 9
  #else
  #  small_card (card[1],suits)
  #end 
end


