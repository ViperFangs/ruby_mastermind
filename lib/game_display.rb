# GameDisplay handles what to display on the command line screen
module GameDisplay
  def instruction_screen
    puts display_instructions
    until valid_gameplay_choice?
      print 'Choose your Gameplay Style: '
      @user_gameplay_choice = gets.chomp.to_i
    end

    system('clear')
  end

  def valid_gameplay_choice?
    user_gameplay_choice == 1 || user_gameplay_choice == 2
  end

  def game_screen
    puts display_color_numbers
    case user_gameplay_choice
    when 1
      # maker_gameplay
    when 2
      breaker_gameplay
    end
  end

  def breaker_gameplay
    puts "The Computer has decided the Master Code"
    puts "Enter your guess and the computer will reveal a clue"
    puts "Example Guess: Type \'1 3 5 2\' without the \'\' for \'Red Blue Cyan Green\'"
    get_current_guess
  end

  def get_current_guess
    print "\nYour Guess: "
    self.current_guess = gets.chomp

    until valid_input? (current_guess)
      incorrect_input
      print "\nYour Guess: "
      self.current_guess = gets.chomp
    end 

    puts "Clues: #{generate_clue(current_guess)}"
  end

  def incorrect_input
    puts "Please enter a valid input"
  end

end