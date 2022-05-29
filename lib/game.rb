# rubocop:disable Metrics/AbcSize

class Game
  include GameInstructions

  def initialize
    display_instructions
  end
end