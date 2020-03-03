def select_fruit(hash,type)
  fruit_hsh = {}
  hash.each {|k, type| 
    if type == "Fruit"
      temp_hsh = {k => type}
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

select_fruit(produce,'fruit') # => {"apple"=>"Fruit", "pear"=>"Fruit"}