arr = ['10', '11', '9', '7', '8']

def reverse_sort_numbered_strings(array)

array.sort do |a,b|

  b.to_i <=> a.to_i

end
end

p reverse_sort_numbered_strings(arr)