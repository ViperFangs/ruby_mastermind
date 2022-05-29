require_relative './game_instructions'
require_relative './game_logic'

class Game
  include GameInstructions
  include GameLogic

  def initialize
    display_instructions
  end
end
