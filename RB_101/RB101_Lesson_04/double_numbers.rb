test = [1,2,4,6,8,10]
def double_numbers(numbers,value)

  counter = 0
  
  loop do
    break if counter == numbers.size
    
    numbers[counter] = numbers[counter] * value
    
    counter += 1
  end

  
end


double_numbers(test,3)

p test