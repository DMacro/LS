hsh = {
  'grape' => {type: 'fruit', colors: ['red', 'green'], size: 'small'},
  'carrot' => {type: 'vegetable', colors: ['orange'], size: 'medium'},
  'apple' => {type: 'fruit', colors: ['red', 'green'], size: 'medium'},
  'apricot' => {type: 'fruit', colors: ['orange'], size: 'medium'},
  'marrow' => {type: 'vegetable', colors: ['green'], size: 'large'},
}

#Given this data structure write some code to return an array containing the colors of the 
#fruits and the sizes of the vegetables. The sizes should be uppercase and the colors should be capitalized.


def fruit_veg (hash)
hash.map do |_,value|
  if value[:type] == 'fruit'
    value[:colors].map do |value| # more thank one value
    value.capitalize
    end
  elsif value[:type] == 'vegetable'
    value[:size].upcase # only one value
  end
end
end

p fruit_veg (hsh)