# Code Maker Gameplay Style
module CodeMaker
  attr_accessor :user_master_code, :current_master_code, :possible_guesses, :range_array,
                :current_computer_clue_array, :current_computer_guess

  def maker_gameplay
    puts display_color_numbers
    input_user_master_code
    convert_user_master_code
    clear_screen
    puts "The Master Code is: #{user_master_code}\n"
    generate_possible_guesses_array
    generate_computer_current_clue('1122')
    remove_different_possible_guesses

    computer_gameplay until available_moves.zero? || winner?
  end

  def input_user_master_code
    puts 'Choose a 4 digit Master Code where each number is between 1 to 6'
    puts "Example Master Code: Type \'1 3 5 2\' without the \'\' for \'Red Blue Cyan Green\'"
    print "\nEnter the Master Code: "
    self.current_master_code = gets.chomp

    until valid_input?(current_master_code)
      display_incorrect_input
      print "\nEnter the Master Code: "
      self.current_master_code = gets.chomp
    end
  end

  def convert_user_master_code
    self.user_master_code = current_master_code.delete(' ').to_i.digits.to_a.reverse
    self.master_code = user_master_code
  end

  def computer_gameplay
    puts if display_guess_clue_array
    display_available_moves
    puts

    generate_computer_current_clue(possible_guesses[0])
    remove_different_possible_guesses
  end

  def generate_computer_current_clue(guess_string)
    self.current_computer_guess = guess_string
    self.current_computer_clue_array = generate_clue(guess_string)
  end

  def generate_possible_guesses_array
    self.range_array = [1, 2, 3, 4, 5, 6]
    self.possible_guesses = range_array.repeated_permutation(4).to_a
  end

  # def remove_different_possible_guesse
  #   possible_guesses.select do |array|
  #     current_computer_clue_array.each
  #   end
  # end
end
