names = ['Sally', 'Joe', 'Lisa', 'Henry']

loop do
  puts names.shift

  break if names == []

end