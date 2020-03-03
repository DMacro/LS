# Add up all of the ages from the Munster family hash

ages = { "Herman" => 32, "Lily" => 30, "Grandpa" => 5843, "Eddie" => 10, "Marilyn" => 22, "Spot" => 237 }

def add_hash_values (hash)

sum_ages = 0

hash.values.each {|i| sum_ages += i} # we can use ages.each {|_,i| sum_ages +=  i} or ages.values.inject(:+) # => 6174

p sum_ages

end

add_hash_values(ages)