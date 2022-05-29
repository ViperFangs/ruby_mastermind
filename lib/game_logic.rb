# GameLogic handles generation of a random number between 1111..6666. It returns clues after every guess
module GameLogic
  attr_accessor :return_clues
  attr_reader :master_code, :user_guess_array

  def generate_master_code
    @master_code = rand(1111..6666).digits.to_a
  end

  def convert_user_guess(guess)
    @user_guess_array = guess.delete(' ').to_i.digits.to_a.reverse
  end

  def valid_input?(guess)
    convert_user_guess(guess)
    user_guess_array.length == 4 && user_guess_array.all? { |number| number.is_a?(Integer) }
  end

  def generate_clue(user_guess)
    return unless valid_input?(user_guess)

    clear_clues
    compare_clue_digits
    shuffle_clues
  end

  def compare_clue_digits
    user_guess_array.each_with_index do |number, index|
      if master_code.include? number
        user_guess_array[index] == master_code[index] ? return_clues.push('$') : return_clues.push('?')
      end
    end
  end

  def clear_clues
    if return_clues.nil?
      self.return_clues = []
      return
    end

    return_clues.clear
  end

  def shuffle_clues
    return_clues.shuffle
  end
end
