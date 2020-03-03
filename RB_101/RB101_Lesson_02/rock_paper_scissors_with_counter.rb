VALID_CHOICES = ['rock', 'paper', 'scissors']


def prompt(message)
  Kernel.puts("=> #{message}")
end

your_score = 0
computer_score = 0

loop do

  choice = ''
  

  loop do
    prompt("Choose one: #{VALID_CHOICES.join(', ')}")
    choice = Kernel.gets().chomp()

    if VALID_CHOICES.include?(choice)
      break
    else
      prompt ('That is not a valid choice.')
    end
  end

  computer_choice = VALID_CHOICES.sample


  Kernel.puts("You chose: #{choice}; Computer chose: #{computer_choice}")

  
  if (choice  == 'rock' && computer_choice == 'scissors') ||
    (choice == 'scissors' && computer_choice == 'paper') ||
    (choice == 'paper' && computer_choice == 'rock') 
    prompt("You won!")
    your_score = your_score + 1
  elsif (choice == 'rock' && computer_choice == 'paper') ||
    (choice == 'scissors' && computer_choice == 'rock') ||
    (choice == 'paper' && computer_choice == 'scissors') 
    prompt("Computer won!")
    computer_score = computer_score + 1
  else 
      prompt("It's a draw!")
      your_score = your_score + 0.5
      computer_score = computer_score + 0.5
  end


  prompt ("would you like to replay")
  answer = Kernel.gets().chomp()
  break unless answer.downcase().start_with?('y')
end

prompt("Thank you for playing!")
sleep(1)
prompt("The overall score is: YOU (#{your_score}) - (#{computer_score}) COMPUTER")