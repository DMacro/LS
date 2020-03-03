def doubler(start)
  puts start
  if start < 10
    doubler(start*2)
    #puts start
  end
end

doubler(3)