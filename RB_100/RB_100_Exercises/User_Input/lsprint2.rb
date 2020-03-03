loop do
   
  input_string = nil
  number_lines = nil

  loop do
    puts ">> How many output lines do you want? Enter a number >= 3 (Q to quit):"
    input_string = gets.chomp.downcase
    break if input_string == "q"
    
    number_lines = input_string.to_i
    
    break if number_lines >= 3
    
    puts "That's not enough lines."

  end

  break if input_string == "q"

  while number_lines > 0
      puts "Launch School is the best!"
      number_lines -= 1
  end

end


