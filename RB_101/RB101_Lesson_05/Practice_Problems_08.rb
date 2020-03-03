hsh = {first: ['the', 'quick'], second: ['brown', 'fox'], third: ['jumped'], fourth: ['over', 'the', 'lazy', 'dog']}

# Using the each method, write some code to output all of the vowels from the strings.

vowels = 'aeiou'

hsh.each do |_,string|
  string.each do |word|
     word.chars.each do |letters|
      puts letters if vowels.include?(letters)  
     end
  end
end