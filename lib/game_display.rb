# frozen_string_literal: true

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
    case user_gameplay_choice
    when 1
      # maker_gameplay
    when 2
      breaker_gameplay
    end
  end

  def breaker_gameplay
    breaker_game_content
    get_current_guess until available_moves.zero? || winner?
  end

  def breaker_game_content
    puts display_color_numbers
    puts 'The Computer has decided the Master Code'
    puts 'Enter your guess and the computer will reveal a clue'
    puts "Example Guess: Type \'1 3 5 2\' without the \'\' for \'Red Blue Cyan Green\'"
  end

  def get_current_guess
    print "\nYour Guess: "
    self.current_guess = gets.chomp

    until valid_input?(current_guess)
      p master_code
      incorrect_input
      print "\nYour Guess: "
      self.current_guess = gets.chomp
    end

    self.current_clue = generate_clue(current_guess)

    puts "Clues: #{current_clue}"
    self.available_moves -= 1

    if winner?
      puts "\nYOU WON"
      puts "#{current_guess} is the Master Code"
      return
    end

    puts "Available Moves: #{available_moves}"
  end
end
