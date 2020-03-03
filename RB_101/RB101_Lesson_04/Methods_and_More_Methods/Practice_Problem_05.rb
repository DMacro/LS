flintstones = %w(Fred Barney Wilma Betty BemBam Pebbles)

# Find the index of the first name that starts with "Be"

p flintstones.index { |name| name[0, 2] == "Be" }
