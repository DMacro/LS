def joinor(array, delim = ', ', word = 'or')

  case array.size
  when 0 then ''
  when 1 then array[0]
  when 2 then "#{array.first} or #{array.last}"
  else 
  array[-1] = "#{word} #{array[-1]}"
              array.join(delim)
  end
end


p joinor([1, 2])                   # => "1 or 2"
p joinor([1, 2, 3])                # => "1, 2, or 3"
p joinor([1, 2, 3], '; ')          # => "1; 2; or 3"
p joinor([1, 2, 3], ', ', 'and')