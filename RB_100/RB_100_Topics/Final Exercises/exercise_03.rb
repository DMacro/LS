array = [1,2,3,4,5,6,7,8,9,10]

array.select do |value| 
  
  if value.odd?
    puts value
  end
end