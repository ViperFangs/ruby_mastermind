# frozen_string_literal: true

require_relative './game_instructions'
require_relative './game_logic'
require_relative './game_display'
require_relative './code_maker'

# Game class calls different methods to display the mastermind game
class Game
  include GameInstructions
  include GameLogic
  include GameDisplay
  include CodeMaker

  attr_accessor :user_gameplay_choice

  def initialize
    play_mastermind
  end

  def play_mastermind
    generate_master_code
    default_values
    clear_screen
    instruction_screen
    game_screen
  end
end
