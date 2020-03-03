# Each player starts with the same basic stats.

player = { "strength" => 10, "dexterity" => 10, "charisma" => 10, "stamina" => 10 }

# Then the player picks a character class and gets an upgrade accordingly.

character_classes = {
  "warrior" => { "strength" =>  20 },
  "thief" =>   { "dexterity" =>20 },
  "scout" =>  { "charisma" => 20 },
  "mage" =>   { "stamina" =>  20 }
}

puts 'Please type your class (warrior, thief, scout, mage):'
input = gets.chomp.downcase

player.merge!(character_classes[input])

puts 'Your character stats:'
puts player