require_relative './game_instructions'
require_relative './game_logic'

# Game class calls different methods to display the mastermind game
class Game
  include GameInstructions
  include GameLogic

  attr_accessor :user_gameplay_choice, :available_moves

  def initialize
    generate_master_code
    self.user_gameplay_choice = -1
    self.available_moves = 12
    play_mastermind
  end

  def play_mastermind
    instruction_screen
    game_screen
  end

  def game_screen
    puts display_color_numbers
    if user_gameplay_choice == 1
      # maker_gameplay
    elsif user_gameplay_choice == 2
      breaker_gameplay
    end
  end
end
