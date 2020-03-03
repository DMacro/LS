def select_fruit(hash)
  fruit_hsh = {}
  hash.each {|k, v| 
    if v == "Fruit"
      temp_hsh = {k => v}
      fruit_hsh.merge!(temp_hsh)
    end}
    p fruit_hsh
    p hash
end



produce = {
  'apple' => 'Fruit',
  'carrot' => 'Vegetable',
  'pear' => 'Fruit',
  'broccoli' => 'Vegetable'
}

select_fruit(produce) # => {"apple"=>"Fruit", "pear"=>"Fruit"}