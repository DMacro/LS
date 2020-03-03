number = 1000.10

new_num = number.to_s

sokt = new_num.split(/[\.]/)

number1 = sokt[1]
number1 += '0'

puts sokt[0] + number1