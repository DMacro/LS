name = 'Roger'
name1 = 'RoGeR'
name2 = 'DAVE'

if name.downcase == name1.downcase
  puts 'true'
else
  puts 'false'
end

if name.downcase == name2.downcase
  puts 'true'
else
  puts 'false'
end

p name.casecmp('RoGeR') == 0
puts name.casecmp(name2) == 0