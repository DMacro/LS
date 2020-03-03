number = nil

loop do
  puts ">> How many output lines do you want? Enter a number >= 3:"
  number = gets.chomp.to_i
  puts "That's not enough lines." if number < 3
  break if number > 2
end

puts "Launch School is the best!\n" * number 

#while loop could be used a with a countdown of 1 per iteration

