def valid_number?(num)
  num.to_i.to_s == num
end

puts "Enter a number"
game_value = ""
loop do
  game_value = gets.chomp

  if game_value == ""
    game_value = "21"
  end
  if valid_number?(game_value)
    game_value = game_value.to_i
    break
  else
    puts "Please enter a valid number"
  end
end

p game_value