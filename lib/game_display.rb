# frozen_string_literal: true

# GameDisplay handles what to display on the command line screen
module GameDisplay
  def instruction_screen
    puts display_instructions
    until valid_gameplay_choice?
      print 'Choose your Gameplay Style: '
      @user_gameplay_choice = gets.chomp.to_i
    end

    clear_screen
  end

  def valid_gameplay_choice?
    user_gameplay_choice == 1 || user_gameplay_choice == 2
  end

  def game_screen
    case user_gameplay_choice
    when 1
      maker_gameplay
    when 2
      breaker_gameplay
    end
  end

  def breaker_gameplay
    breaker_gameplay_content until available_moves.zero? || winner?

    if winner?
      display_winner_if_won
    else
      display_out_of_moves
    end

    exit unless retry_game?
    play_mastermind
  end

  def breaker_gameplay_content
    clear_screen
    puts display_color_numbers

    puts if display_guess_clue_array
    display_available_moves
    puts

    input_current_guess
    generate_current_clue
    display_current_clue
  end

  def display_guess_clue_array
    return false if guess_clue_array.empty?

    guess_clue_array.each do |hash|
      hash.each do |key, value|
        print "#{key}: #{value}\t\t"
      end

      puts
    end
  end

  def input_current_guess
    puts 'Enter your guess and the computer will reveal a clue'
    puts "Example Guess: Type \'1 3 5 2\' without the \'\' for \'Red Blue Cyan Green\'"
    print "\nEnter your Guess: "
    self.current_guess = gets.chomp

    until valid_input?(current_guess)
      p master_code
      display_incorrect_input
      print "\nEnter your guess: "
      self.current_guess = gets.chomp
    end
  end

  def generate_current_clue
    self.current_clue = generate_clue(current_guess)
    self.available_moves -= 1
  end

  def display_current_clue
    puts "Clues: #{current_clue}"
  end

  def display_winner_if_won
    return unless winner?

    clear_screen
    puts "\nYOU HAVE WON THE GAME"
    puts "#{master_code.join} is the Master Code"
    true
  end

  def display_available_moves
    puts "Available Moves: #{available_moves}"
  end

  def display_out_of_moves
    clear_screen
    puts "\nThe Computer has Outsmarted you!"
    puts "#{master_code.join} is the Master Code"
  end

  def clear_screen
    system('clear')
  end

  def out_of_moves?
    available_moves.zero?
  end

  def retry_game?
    print "\nWould you like to retry the game? [y/n]: "
    gets.chomp.downcase == 'y'
  end
end
