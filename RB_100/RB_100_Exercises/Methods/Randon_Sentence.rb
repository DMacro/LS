names = ['Dave', 'Sally', 'George', 'Jessica']
activities = ['walking', 'running', 'cycling']


def name(names)
  names[rand(names.length)]
end

def activity(activities)
  activities[rand(activities.length)]
end

def sentence (name, activity)
  name + " went " + activity + " today."
end


puts sentence(name(names), activity(activities))
