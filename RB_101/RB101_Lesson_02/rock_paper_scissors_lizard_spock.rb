CHOICES = %w((r)rock (p)paper (sc)scissors (l)lizard (sp)spock)
VALID_CHOICES = %w(r p sc l sp)

def prompt(message)
  Kernel.puts("=> #{message}")
end

def win?(first, second, first_score, second_score)
  (first == 'r' && second == 'l') ||
    (first == 'r' && second == 'sc') ||
    (first == 'p' && second == 'r') ||
    (first == 'p' && second == 'sp') ||
    (first == 'sc' && second == 'p') ||
    (first == 'sc' && second == 'l') ||
    (first == 'l' && second == 'sp') ||
    (first == 'l' && second == 'p') ||
    (first == 'sp' && second == 'sc') ||
    (first == 'sp' && second == 'r')
end

def display_results(player, computer, your_score, computer_score)
  if win?(player, computer, your_score, computer_score)
    prompt("You won!")
  elsif win?(computer, player, your_score, computer_score)
    prompt("Computer won!")
  else
    prompt("It's a draw!")
  end
end

def update_score(player, computer, your_score, computer_score)
  if win?(player, computer, your_score, computer_score)
    your_score = your_score + 1
  elsif win?(computer, player, your_score, computer_score)
    computer_score  = computer_score + 1
  else
    your_score = your_score + 0.5
    computer_score  = computer_score + 0.5
  end
end

your_score = 0
computer_score = 0

loop do
  choice = ''

  loop do
    prompt("Choose one: #{CHOICES.join(', ')}")
    choice = Kernel.gets().chomp().to_s

    if VALID_CHOICES.include?(choice)
      break
    else
      prompt('That is not a valid choice.')
    end
  end

  computer_choice = VALID_CHOICES.sample

  Kernel.puts("You chose: #{choice}; Computer chose: #{computer_choice}")

  display_results(choice, computer_choice, your_score, computer_score)
  
  update_score(choice, computer_choice, your_score, computer_score)

  prompt("would you like to replay")
  answer = gets().chomp()
  break unless answer.downcase().start_with?('y')
  break if (your_score) || (computer_score) >= 5.0
end

prompt("Thank you for playing!")
prompt("The overall score is:")
prompt("you (#{your_score}); computer (#{computer_score})")
