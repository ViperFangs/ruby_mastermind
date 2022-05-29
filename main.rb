# rubocop:disable Metrics/AbcSize

require_relative './lib/game_rules.rb'

class Mastermind
  include GameRules
  def initialize
    display_rules
  end
end

Mastermind.new
