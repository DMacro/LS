car = {
  type:  'sedan',
  color: 'blue',
  year:  2003
}

car_a = [[:type,'sedan'],[:color,'blue'],[:year,2003]]

car_convert = car.to_a

p car_convert

car_rev =car_convert.to_h

p car_rev

p car.map { |k, v| [k, v] }