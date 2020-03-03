arr = [[2], [3, 5, 7], [9], [11, 13, 15]]

arr_new = []

def multiple_of_3 (array)
array.map do |sub_arr|
  sub_arr.select do |number|
    number % 3 == 0
  end 
end
end

p multiple_of_3 (arr)