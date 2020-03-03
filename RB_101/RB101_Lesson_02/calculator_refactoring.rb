# asks for two numbers
# asks for the type of operation to perform: add, subtract, multiply or divide
# displays the result
# refactor

require 'yaml' 

# method to output test in a message format (i.e. =>)
def prompt(message)
  Kernel.puts("=> #{message}")
end

# method to check if variable is an integer 
def integer?(num)
  num.to_i.to_s == num # converts num to interger and back to string and then compares this with num.

  #num.match(/\d/) # this asks is input num has any letters in it.
end

# method to check if variable is an float 
def float?(num)
  num.to_f.to_s == num # converts num to interger and back to string and then compares this with num.

  #num.match(/\d/) # this asks is input num has any letters in it.
end

# method to check if variable is an integer or float by passing the variables into other methods
def valid_number?(num)

    integer?(num) || float?(num)

  #num.match(/\d/) # this asks is input num has any letters in it.
end

# method to display an operation from user input
def operation_to_message(op)
  case op
  when '1'
    '+'
  when '2'
    '-'
  when '3'
    '/'
  when '4'
    '*'
  end
end

lang_choice = ''
language = <<-MSG
Welcome, to begin please enter 1 for English. 
=> Välkommen, för att börja ange 2 för Svenska. 
=> Bienvenido, para comenzar por favor ingrese 3 para Español"
MSG
prompt(language)


# do loop to choose a language/
loop do
  lang_choice = Kernel.gets().chomp()
  if %w(1 2 3).include?(lang_choice)
    break
  else
    prompt("1 for English, 2 för Svenska, 3 para Español")
  end
end

# takes user lang input and provides key to the yaml file.
lang =  case lang_choice
  when '1'
    :english
  when '2'
    :swedish
  when '3'
    :spanish
end

# Initialising Variables
#data = YAML.load(File.open(File.join(File.dirname(__FILE__), 'calculator_refactoring.yml'))) # loading yaml file
data = YAML.load_file('calculator_refactoring.yml')
flan = data[lang] #file and user language key
name = '' # name of user

#key a shown from yaml file
prompt"#{flan[:a]}"

# get user name
loop do
  name = Kernel.gets().chomp()
  if name.empty?()
    prompt("#{flan[:b]}") 
  else
    break
  end
end

# get user name
prompt("#{flan[:c]}"+" #{name} "+"#{flan[:ca]}")
# Loops over the entire mathematical portion of program until user wishes to quit.
loop do
# Initialising Variables
num01 = ''
num02 = ''

  loop do # gets first number from user and validates that it is an integer or a string
    prompt("#{flan[:d]}")
    num01 = Kernel.gets().chomp()

    if valid_number?(num01)
      break
    else

      prompt("#{flan[:e]}")
    end
  end

  loop do # gets second number from user and validates that it is an integer or a string
    prompt("#{flan[:f]}")
    num02 = Kernel.gets().chomp()
    if valid_number?(num02)
      break
    else
      prompt("#{flan[:e]}")
    end
  end

  prompt("#{flan[:g]}")

  operator = ''

  loop do # requests operation from the user
    operator = Kernel.gets().chomp()
    if %w(1 2 3 4).include?(operator)
      break
    else
      prompt("#{flan[:ga]} #{operator} #{flan[:gb]}")
    end
  end

  prompt("#{operation_to_message(operator)} the two numbers...")

  result =  case operator
            when '1'
              num01.to_f + num02.to_f
            when '2'
              num01.to_f - num02.to_f
            when '3'
              num01.to_f / num02.to_f
            when '4'
              num01.to_f * num02.to_f
            end
  sleep (1.75)
  prompt("#{flan[:i]} #{result}") # shows test and result of operation
  prompt("#{flan[:j]}") # asks if user wishes to have more operations

  another_cal = gets().chomp()
  break unless another_cal.downcase().start_with?('y')
end

prompt("#{flan[:k]} #{name} #{flan[:ka]}")
