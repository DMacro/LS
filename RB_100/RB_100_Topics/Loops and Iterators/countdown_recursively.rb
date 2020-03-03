def cdr(number)
  
  if number < 0
    puts number
    cdr(number + 1)
  elsif number == 0
    puts number
  else
    puts number
    cdr(number - 1)
  end
end

cdr(0)