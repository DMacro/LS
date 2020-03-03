# Pick out the minimum age from our current Munster family hash:


ages = { "Herman" => 32, "Lily" => 30, "Grandpa" => 5843, "Eddie" => 10, "Marilyn" => 22, "Spot" => 237 }

p ages.values.min

youngest  = 0
ages.each_value do |i|
  if i > youngest
    youngest = i
  end
end
p youngest # this is the oldest
ages.each_value do |i| 
  if i < youngest
    youngest = i
  end
end

p youngest