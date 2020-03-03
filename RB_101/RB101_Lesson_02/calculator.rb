# asks for two numbers
# asks for the type of operation to perform: add, subtract, multiply or divide
# displays the result

Kernel.puts("Please enter the first number")
num_01 = Kernel.gets().chomp().to_i
Kernel.puts("Thank you. Please enter the second number")
num_02 = Kernel.gets().chomp().to_i
Kernel.puts("Thank you. What operation would you like to carry out? (1) Addition, (2) Subtraction, (3) Division or (4) Multiplication?")
operator = Kernel.gets().chomp().downcase

if  operator == '1'
  Kernel.puts "The answer #{num_01} added to #{num_02} is"
  Kernel.puts num_01 + num_02
elsif operator == '2'
  Kernel.puts "The answer #{num_01} substracted from to #{num_02} is"
  Kernel.puts num_01 - num_02
elsif  operator == '3'
  Kernel.puts "The answer #{num_01} divided by #{num_02} is"
  Kernel.puts num_01.to_f / num_02.to_f
else operator == '4'
  Kernel.puts "The answer #{num_01} multiplied by to #{num_02} is"
  Kernel.puts num_01 * num_02
end