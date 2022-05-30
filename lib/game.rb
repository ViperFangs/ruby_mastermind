# frozen_string_literal: true

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
    case user_gameplay_choice
    when 1
      # maker_gameplay
    when 2
      breaker_gameplay
    end
  end
end
