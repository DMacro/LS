
ages = { "Herman" => 32, "Lily" => 30, "Grandpa" => 402, "Eddie" => 10 }

#remove people with age 100 and greater.

new_hash = {}

p ages.reject { |k,v| v > 100 } # ages.keep_if { |_, age| age < 100 }
