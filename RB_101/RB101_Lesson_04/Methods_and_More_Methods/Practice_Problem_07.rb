 "The Flintstones Rock"
# Returns a hash with the letters (as key) and their respective frenquency (as values):

def character_frenquency(text)

l_count = {}
letters = ('a'..'z').to_a + ('A'..'Z').to_a + ('0'..'9').to_a
  letters.each do |letter|
    letter_count = text.scan(letter).count  
    l_count[letter] = letter_count if letter_count > 0
  end
  p l_count
end

character_frenquency("The Flintstones Rock 2022")