
# Given this data structure, return a new array of the same structure 
# but with the sub arrays being ordered 
#(alphabetically or numerically as appropriate) in descending order.

arr = [['b', 'c', 'a'], [2, 1, 3], ['blue', 'black', 'green']]

def descending_sort (array)
array.map do |i|
  i.sort do |a,b|
    b <=> a
  end
end

end
p descending_sort (arr)

p arr