def change_me(string)

  array = []
  substring_arr = string.split(' ')

  counter = 0

  loop do
    break if counter == substring_arr.size
    if palindromes?(substring_arr,counter) 
      array << substring_arr[counter].upcase
    else
      array << substring_arr[counter]
    end
    counter += 1
  end
   new_string = array.join(' ')
  p new_string
end


def palindromes?(sub_string,count)

  sub_string[count] == sub_string[count].reverse && sub_string[count].size != 1

end
change_me("We will meet at noon")
change_me("No palindromes here")
change_me("")
change_me("I LOVE my i 12 mom and dad equally")