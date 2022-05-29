# GameLogic handles generation of a random number between 1111..6666. It returns clues after every guess
class GameLogic
  attr_accessor :return_clues, :user_guess_array, :master_code

  def generate_master_code
    self.master_code = rand(1111..6666).digits.to_a
  end

  def convert_user_guess(guess)
    self.user_guess_array = guess.delete(' ').to_i.digits.to_a
  end

  def valid_input?(guess)
    convert_user_guess(guess)
    user_guess_array.length == 4 && user_guess_array.all? { |number| number.is_a?(Integer) }
  end

  def generate_clue(user_guess)
    return unless valid_input?(user_guess)
  end
end

GameLogic.new.generate_master_code
