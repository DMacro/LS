# optional_parameters

def greeting(name,options = {})

  if options.empty?
    puts "Hi my name is #{name}"
  else
    puts "Hi my name is #{name} and i am #{options[:age]} years old."
    puts "I am from the beautiful city of #{options[:city]}"
  end
end

greeting("Dessie")

greeting("Dessie",{age:37,city:"Dublin"})

