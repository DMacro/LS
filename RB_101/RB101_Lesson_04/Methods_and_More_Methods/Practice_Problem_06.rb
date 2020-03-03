flintstones = %w(Fred Barney Wilma Betty BamBam Pebbles)

# Amend this array so that the names are all shortened to just the first three characters:

# p flintstones.map { |word| word.slice!(0,3)} #flintstones.map! { |name| name[0,3] }

def first_3_letters(array)
s_arr = []

array.each do |i|
  s_arr << i[0,3]
end

p s_arr

end

first_3_letters(flintstones)