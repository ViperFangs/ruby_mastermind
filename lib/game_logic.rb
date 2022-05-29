#GameLogic handles generation of a random number between 1111..6666. It also return clues after every guess
class GameLogic

  attr_accessor :return_clues, :user_guess_array
  attr_reader :master_code 

  def generate_master_code
    master_code = rand(1111..6666).digits.to_a
  end

  def convert_user_guess(guess)
    user_guess_array = guess.delete(' ').to_i.digits.to_a
  end

  def valid_input?(guess)

    convert_user_guess(guess)

    return true if user_guess_array.length == 4 and user_guess_array.all? do |number|
      number.is_a?(Integer)
    end
  end
  
  def generate_clue(user_guess)
    return unless valid_input?(user_guess)
  end
end

GameLogic.new.generate_master_code