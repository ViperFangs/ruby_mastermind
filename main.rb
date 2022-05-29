# rubocop:disable Metrics/AbcSize

require_relative './lib/game_instructions.rb'

class Mastermind
  include GameInstructions
  def initialize
   display_instructions
  end
end

Mastermind.new
