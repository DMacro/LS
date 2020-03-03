def optional_parameter(standard,hash={})

	if hash.empty?
		puts "This is #{standard}!"
	else
		puts "This is not just #{standard} buts also #{hash[:key1]} and #{hash[:key2]}"
	end
end

optional_parameter("argument")
optional_parameter("argument",{key1:"a hash value1", key2: "a hash value2!"})