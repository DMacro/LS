colors = ['red', 'dark blue', 'turquoise', 'silver', 'black']
things = ['pen', 'notebook']

colors.shuffle!
things.shuffle!

i = 0
loop do
  break if i > colors.length-1 || i > things.length-1


  if i == 0
    puts "I have a #{colors[i]} #{things[i]}."
  else
    puts "And a #{colors[i]} #{things[i]}."
  end

  i += 1
end