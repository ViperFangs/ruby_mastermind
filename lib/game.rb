# frozen_string_literal: true

require_relative './game_instructions'
require_relative './game_logic'
require_relative './game_display'

# Game class calls different methods to display the mastermind game
class Game
  include GameInstructions
  include GameLogic
  include GameDisplay

  attr_accessor :user_gameplay_choice

  def initialize
    generate_master_code
    default_values
    play_mastermind
  end

  def play_mastermind
    instruction_screen
    game_screen
  end
end
