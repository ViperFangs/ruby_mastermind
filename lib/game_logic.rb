# frozen_string_literal: true

# GameLogic handles generation of a random number between 1111..6666. It returns clues after every guess
module GameLogic
  private

  attr_accessor :return_clues, :current_guess, :current_clue, :user_guess_array, :guess_clue_array, :available_moves,
                :missed_array, :modified_guess_array
  attr_reader :master_code

  MASTER_CODE_LENGTH = 4

  def generate_master_code
    @master_code = []

    MASTER_CODE_LENGTH.times { @master_code.push(rand(1..6)) }
  end

  def generate_clue(user_guess)
    return false unless valid_input?(user_guess)

    clear_clues
    compare_clue_digits
    self.current_clue = shuffle_clues
    guess_clue_array << { 'Guess' => user_guess_array.to_s, 'Clue' => current_clue.to_s }
    current_clue
  end

  def valid_input?(user_guess)
    convert_user_guess(user_guess)
    user_guess_array.length == MASTER_CODE_LENGTH && user_guess_array.all? { |number| number.is_a?(Integer) }
  end

  def convert_user_guess(user_guess)
    self.user_guess_array = user_guess.delete(' ').to_i.digits.to_a.reverse
  end

  def clear_clues
    if return_clues.nil?
      self.return_clues = []
      return
    end

    return_clues.clear
  end

  def compare_clue_digits
    self.missed_array = []
    self.modified_guess_array = user_guess_array[0..user_guess_array.length]
    clue_handler
    missed_array_handler
  end

  def clue_handler
    master_code.each_with_index do |number, index|
      if user_guess_array[index] == master_code[index]
        return_clues.push('$')
        modified_guess_array[index] = nil
      else
        missed_array.push(number)
      end
    end
  end

  def missed_array_handler
    return if missed_array.nil?

    missed_array.compact!

    missed_array.each do |number|
      if modified_guess_array.include? number
        return_clues.push('?')
        modified_guess_array.delete_at(modified_guess_array.find_index(number))
      end
    end
  end

  def shuffle_clues
    return_clues.shuffle
  end

  def winner?
    user_guess_array == master_code
  end

  def default_values
    self.user_gameplay_choice = -1
    self.available_moves = 12
    self.guess_clue_array = []
  end
end
