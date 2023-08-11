MOVES = %w(rock paper scissors lizard spock)
WINS_NEEDED = 3
WINNING_MOVES = {
  rock: %w(scissors lizard),
  paper: %w(rock spock),
  scissors: %w(paper lizard),
  lizard: %w(paper spock),
  spock: %w(rock scissors)
}

def prompt(message)
  puts("=> #{message}")
end

def choose_move
  loop do
    prompt("Please select your move - Rock, Paper, Scissors, Lizard, Spock.")
    prompt("You can use the full name, or the first letter or two.")
    choice = gets.chomp.downcase
    if valid_move?(choice)
      return converted_move(choice)
    else
      prompt("Please enter a valid choice.")
      puts
    end
  end
end

def valid_move?(choice)
  num_starting_with = MOVES.select do |move|
    move.start_with?(choice)
  end
  MOVES.include?(choice) ||
    ((num_starting_with.length > 0) && choice.length > 0)
end

def converted_move(choice)
  starts_with_choice = MOVES.select do |move|
    move.start_with?(choice)
  end
  if starts_with_choice.length == 1
    starts_with_choice[0]
  else
    prompt("Oop - two moves start with '#{choice}'.
     \n Please enter at least 1 more character.")
    puts
    read_move
  end
end

def player_wins_turn?(player_move, computer_move)
  WINNING_MOVES[player_move.to_sym].include?(computer_move)
end

def keep_score(player_victory, player_score, computer_score)
  if player_victory
    player_score += 1
  else
    computer_score += 1
  end
  [player_score, computer_score]
end

def display_turn_results(player_victory)
  case player_victory
  when true
    prompt("You won!")
  when false
    prompt("Computer won!")
  else
    prompt("It's a tie!")
  end
end

def display_game_results(player_score)
  if player_score == 3
    prompt("Unbelievable! You're the Grand Winner!")
  else
    prompt("Sorry... The Computer is the Grand Winner.")
  end
end

def game_over?(player_score, computer_score)
  player_score == WINS_NEEDED || computer_score == WINS_NEEDED
end

def play_another?
  loop do
    prompt("Wanna play again? Ya feelin' lucky?")
    answer = gets.chomp.downcase
    if answer == 'n' || answer == 'y'
      return answer == 'y'
    else
      prompt("Please enter a valid response.")
    end
  end
end

puts("Welcome to RockPaperScissorsLizardSpock.")
puts('(Try saying that 3x fast)')
puts("You'll be matching up against the computer.")
puts("The first to 3 wins!")

loop do
  player_score = 0
  computer_score = 0

  loop do
    player_victory = nil
    player_move = choose_move
    computer_move = MOVES.sample

    prompt("Your move is #{player_move.capitalize}")
    prompt("The computer's move is #{computer_move.capitalize}")

    unless player_move == computer_move
      player_victory = player_wins_turn?(player_move, computer_move)
      player_score, computer_score =
        keep_score(player_victory, player_score, computer_score)

    end

    display_turn_results(player_victory)

    prompt("You've got #{player_score}")
    prompt("The computer's got #{computer_score}")

    break if game_over?(player_score, computer_score)
  end

  display_game_results(player_score)

  break unless play_another?
end

prompt("Thank you for playing. Goodbye!")
