# module GameInstructions contains display instructions for the game
module GameInstructions
  def display_instructions
    puts <<~HEREDOC

      Mastermind Game Rules:

      This is a 1-player game against the computer. You can choose to be the Code Maker or Code Breaker.

      There are six different color combinations:
        Red = 1
        Green = 2
        Blue = 3
        Yellow = 4
        Cyan = 5
        Purple = 6

      The code maker will choose four to create a 'master code'. For example,
        'Red, Blue, Green, Red' can be typed as: '1 3 2 1' (Without the '')

      As you can see, there can be more then one of the same color.
      In order to win, the code breaker needs to guess the 'master code' in 12 or less turns.

      Clues:
      After each guess, there will be up to four clues to help crack the code.

        $ This clue means you have 1 correct number in the correct location.
        ? This clue means you have 1 correct number, but in the wrong location.

      Clue Example:
      To continue the example, using the above 'master code' a guess of "1134" would produce 3 clues:
        1 1 3 4  Clues: $ ? ?

      The guess had 1 correct number in the correct location and 2 correct numbers in a wrong location.

      Pick Your Poison:
        Type '1' to be the MAKER
        Type '2' to be the BREAKER
    HEREDOC
  end

  def display_color_numbers
    puts <<~HEREDOC
      Red = 1
      Green = 2
      Blue = 3
      Yellow = 4
      Cyan = 5
      Purple = 6
    HEREDOC
  end
end