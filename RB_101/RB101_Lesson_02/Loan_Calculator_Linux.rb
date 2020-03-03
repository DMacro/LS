# the loan amount
# the Annual Percentage Rate (APR)
# the loan duration
# need to validate number (must be intergers or floats and must be positive)
# Ask is this is required again.
require_relative "text_format.rb"

def prompt(message)
  format_type("=> #{message}", '', 'clear')
end

def question_prompt(message)
  format_type("=> #{message}", '', 'yellow')
end

def warning_prompt(message)
  format_type("=> #{message}", '', 'red')
end

def information_prompt(message)
  format_type("=> #{message}", '', 'light_blue')
end

def important_prompt(message)
  format_type("=> #{message}", '', 'bold')
end

def valid_integer?(value)
  value.to_i.to_s == value
end

def valid_float?(value)
  value.to_f.to_s == value
end

def valid?(value)
  valid_float?(value) || valid_integer?(value)
end

def years_to_months(years)
  years.to_f * 12
end

def interest_convert(annual_rate)
  annual_rate.to_f.round(2) / 1200
end

def loan_convert(loan_value)
  loan_value.to_f.round(2)
end

def repayments(val, ir, loan_months)
  # p = loan amount; j = monthly interest rate; n = loan duration in months
  val * (ir / (1 - (1 + ir)**(-loan_months))) # monthly repayment
end

# Initialising variables as strings
borrowed = '' # loan amount
apr = '' # annual interest rate
timeframe_years = '' # years

question_prompt('Welcome to the loan calculator. Please enter your name?')

name = gets.chomp()

prompt("Hello #{name}. My name is MALCAL. I am an automated bankbot.")
prompt('I am here to assist you in your application today.')
prompt('I will require the following pieces of information:')

information = <<~MSG
  =>  1. Value you wish to borrow (€)
  =>  2. Annual Percentage Rate (%)
  =>  3. The Payback duration (years).
MSG

important_prompt(information)

loop do
  loop do
    loop do
      question_prompt("LOAN VALUE: please enter value in euros (€).")
      borrowed = gets.chomp
      if valid?(borrowed)
        break
      elsif warning_prompt('You have not entered a correct value!')
        warning_prompt('Please enter a valid figure (e.g. 10,000)')
      end
    end

    loop do
      question_prompt("INTEREST RATE: please enter the APR percentage (%)")
      apr = gets.chomp
      if valid?(apr)
        break
      elsif warning_prompt('You have not entered a correct value!')
        warning_prompt('Please enter a valid figure (e.g. 5.5)')
      end
    end

    loop do
      question_prompt("TIMEFRAME: please enter payback period in years)")
      timeframe_years = gets.chomp

      if valid?(timeframe_years)
        break
      elsif warning_prompt('You have not entered a correct value!')
        warning_prompt('Please enter a valid figure (i.e 2.5, 3, etc.)')
      end
    end

    prompt("Great #{name}! So just to recap you are looking to borrow:")
    information_prompt("€#{borrowed.to_f}")
    prompt('At an interest rate of:')
    information_prompt("#{apr.to_f}%")
    prompt('Over a period of:')
    information_prompt("#{timeframe_years.to_f} years")

    question_prompt("Do you want to change any figures?")
    change = gets.chomp.downcase
    if change.start_with?('y')
    else
      break
    end
  end
  sleep(1.25)

  time_months = years_to_months(timeframe_years)
  interest = interest_convert(apr)
  loan = loan_convert(borrowed)
  monthly_payments = repayments(loan, interest, time_months)
  total_repayments = monthly_payments * time_months
  interest_paid = total_repayments - loan

  important_prompt('Monthly repayment:')
  warning_prompt("€#{monthly_payments.round(2)}")
  important_prompt('Payback Period:')
  warning_prompt("#{time_months} months.")

  important_prompt('Total payback of:')
  warning_prompt("€#{total_repayments.round(2)}")
  important_prompt('Interest payable on loan:')
  warning_prompt("€#{interest_paid.round(2)}")
  sleep(0.5)

  prompt("Would you like to do another calculation? (y/n)")

  reapply = gets.chomp.downcase
  if reapply.start_with?('y')
  else
    break
  end
end
prompt("Great. Thank you #{name} for your time.")
sleep(1.0)
prompt('I hope this has been helpful for you.')
prompt('Best of luck for you and your finances in the future.')
