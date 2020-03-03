

  arr = [1,3,5,7,9,11]
  
  number = 3 

  arr.each do |i|

    if i == number
      puts "#{number} is held within this array"
    else
      puts "#{number} is NOT held within this array"
    end
  end



  #if arr.include? (number)
  #  puts "The number #{number} is included!"
  #else
  #  puts "The number #{number} is not included"
  #end
