status = ['awake', 'tired'].sample


var = if status == 'awake'
        "Be productive!"
      else
        "Go to sleep!"
      end

puts var
