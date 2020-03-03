# the loan amount
# the Annual Percentage Rate (APR)
# the loan duration
# need to validate number (must be positive)



def prompt (message)
  puts ("=> #{message}")
end

def format_bold (text)
  "\e[1m€#{text}\e[0m"
  end

def num? (value)
  value.to_i.to_s == value
end

def valid? (value)
  value.match(/[\d.,-]/) 
end

def timeframe?(years)
  years.match(/[1-20]/)
end


borrowed = ''#loan amount
apr = '' #annual interest rate
timeframe = '' #years

prompt ("Welcome to loan calculator please enter your name?")
name = gets.chomp()

prompt("Hello #{name}. I am Morcloc the bankbot. I am here to  assist you in your application today. ")

sleep(1)

Information = <<-MSG

To enable me to to do this I will require the following pieces of information.

 - Value you wish to borrow
 - Annual Percentage Rate (APR)
 - The Payback duration.

MSG

prompt(Information)

loop do
  prompt ("please enter value you wish to borrow in euros")
  borrowed = gets.chomp
  if valid?(borrowed)
    break
    else prompt("You have not entered a correct value! Please enter a figure above zero")
  end
end

loop do
  prompt ("please enter the APR percentage")
  apr = gets.chomp
  if valid?(apr)
    break
    else  prompt("You have not entered a correct value! Please enter a figure above zero")
  end
end

loop do
  prompt ("please how time frame for borrowing. Please submit term between 1 and 20 years")
  timeframe = gets.chomp

  if timeframe?(timeframe)
    break
    else prompt("You have not entered a correct value! Please enter a between 1 and 20 (years)")
  end
end



 
prompt("Great #{name}, so you are looking to borrow #{borrowed} euros at an #{apr}% interest rate over a #{timeframe} year period.")

n = timeframe.to_f * 12 # loan duration in months
j = apr.to_f / 1200 # monthly interest rate
borrowed = borrowed.to_f # loan borrowed

puts n
puts j
puts borrowed

monthly_payments = borrowed * (j / (1 - (1 + j)**(-n.to_f))) #monthly repayment

p monthly_payments.round(2)
