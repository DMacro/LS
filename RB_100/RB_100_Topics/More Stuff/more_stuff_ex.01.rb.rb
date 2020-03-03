
def string_check(word)

  if  /lab/i =~ word 
    puts word
  end
end

string_check("laboratory")
string_check("experiment")
string_check("Pans_Labyrinth")
string_check("elaborate")
string_check("polar bear")