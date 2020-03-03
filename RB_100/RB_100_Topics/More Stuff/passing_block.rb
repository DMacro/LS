def my_block(age,&block)
  block.call(age)
end

age = 37

my_block (age) do |num|
  puts "Congradulations you are #{age} years old."
end
