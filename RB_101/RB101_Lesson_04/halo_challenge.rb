#p substrings('halo') == ["ha", "hal", "halo", "al", "alo", "lo"] # => true

def substrings(string)
  counter = 0
  array = []
  sub_arr = string.split('')
  max_count = sub_arr.size - 1
  
  loop do
    
    min = counter + 1
    sub_arr[counter] + sub_arr[min]
    break if max_count - min = 2
    min += 1

  end
    counter += 1


  end
  
  p max_count


  p sub_arr
end

substrings('Dessie')