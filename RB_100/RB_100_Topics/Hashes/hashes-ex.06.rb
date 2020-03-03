words =  ['demo', 'none', 'tied', 'evil', 'dome', 'mode', 'live',
         'fowl', 'veil', 'wolf', 'diet', 'vile', 'edit', 'tide', 
        'flow', 'neon']

results = {}

words.each do |word|

key = word.split('').sort.join

 results.has_key?(key)

  if results.has_key?(key)
      results[key].push(word)
  else
     results[key] = [word]

  end
end

results.each_value do |v|
  puts "--------"
  p v
end
