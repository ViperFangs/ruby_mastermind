# Code Maker Gameplay Style
module CodeMaker
  attr_accessor :user_master_code, :current_master_code, :possible_guesses, :range_array,
                :current_computer_clue_array, :computed_clues, :computed_missed_array, 
                :modified_computer_guess_array, :current_computer_guess_array

  def maker_gameplay
    puts display_color_numbers
    input_user_master_code
    convert_user_master_code
    clear_screen
    puts "The Master Code is: #{master_code}\n"
    generate_possible_guesses_array
    generate_computer_current_clue
    remove_different_possible_guesses

    computer_gameplay until available_moves.zero? || winner?

    exit unless retry_game?
    play_mastermind
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
    self.master_code = current_master_code.delete(' ').to_i.digits.to_a.reverse
  end

  def computer_gameplay
    clear_screen
    puts "The Master Code is: #{master_code}\n\n"
    puts if display_guess_clue_array
    display_available_moves
    puts

    generate_computer_current_clue(possible_guesses[0])
    remove_different_possible_guesses
  end

  def generate_computer_current_clue(guess_array = [1, 1, 2, 2])
    self.current_computer_guess_array = guess_array
    p guess_array
    self.current_computer_clue_array = generate_clue(guess_array.join)
    self.available_moves -= 1
  end

  def remove_different_possible_guesses
    possible_guesses.select! do |array|
      self.computed_clues = []
      self.computed_missed_array = []
      self.modified_computer_guess_array = current_computer_guess_array[0..current_computer_guess_array.length]
      computed_clue_handler(array)
      computed_missed_array_handler

      computed_clues.sort == current_computer_clue_array.sort
    end
  end

  def computed_clue_handler(array)
    array.each_with_index do |number, index|
      if current_computer_guess_array[index] == array[index]
        computed_clues.push('$')
        modified_computer_guess_array[index] = nil
      else
        computed_missed_array.push(number)
      end
    end
  end

  def computed_missed_array_handler
    return if computed_missed_array.nil?

    computed_missed_array.compact!

    computed_missed_array.each do |number|
      if modified_computer_guess_array.include? number
        computed_clues.push('?')
        modified_computer_guess_array.delete_at(modified_computer_guess_array.find_index(number))
      end
    end
  end
end