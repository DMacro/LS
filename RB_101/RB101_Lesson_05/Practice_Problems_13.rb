arr = [[1, 6, 7], [1, 4, 9], [1, 8, 3]]

# sorted should look like this [[1, 8, 3], [1, 6, 7], [1, 4, 9]]

def sort_arrays(arr)
arr.sort_by do |sub_arr|
  sub_arr.select do |num|
    num.odd?
  end
end
end

p sort_arrays(arr)
p arr