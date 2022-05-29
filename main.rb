# rubocop:disable Metrics/AbcSize

class Mastermind
  def initialize
    display_rules
  end

  def display_rules
    puts "\nThis is how to play Mastermind:\n\nThis is a 1-player game against the computer.\nYou can choose to be the code maker or the code breaker."
    puts "\nThere are 6 different types of color combinations:\n"
  end
end

Mastermind.new