# rubocop:disable Metrics/MethodLength

# module GameRules contains display instructions for the game
module GameRules
  def display_rules
    puts %(

How to play Mastermind:

This is a 1-player game against the computer. You can choose to be the Code Maker or Code Breaker.

There are six different color combinations:
red = 1
green = 2
blue = 3
yellow = 4
cyan = 5
purple = 6

The code maker will choose four to create a 'master code'. For example,
red, blue, green, red [1, 3, 2, 1]

As you can see, there can be more then one of the same color.
In order to win, the code breaker needs to guess the 'master code' in 12 or less turns.

Clues:
After each guess, there will be up to four clues to help crack the code.

  $ This clue means you have 1 correct number in the correct location.
  ? This clue means you have 1 correct number, but in the wrong location.

Clue Example:
To continue the example, using the above 'master code' a guess of "1134" would produce 3 clues:
[1, 1, 3, 4]  Clues: [$, ?, ?]

The guess had 1 correct number in the correct location and 2 correct numbers in a wrong location.

Would you like to be the MAKER or BREAKER?

Type '1' to be the MAKER
Type '2' to be the BREAKER
    )
  end
end

# rubocop:enable Metrics/MethodLength