PASSWORD = "SecreT"
USERNAME = "admin"

loop do

  puts ">> Please enter user name:"
  username_entered = gets.chomp
  puts ">> Please enter your password:"
  password_entered = gets.chomp

  break if password_entered == PASSWORD && username_entered == USERNAME

  puts ">> Authorization failed!"

end

puts "Welcome!"