# Mastermind Board Game in Ruby

The Mastermind Board Game made in Ruby.

Live Preview: https://replit.com/@ViperFangs/Mastermind#main.rb

## Description

Mastermind Game Rules:

      This is a 1-player game against the computer. You can choose to be the Code Maker or Code Breaker.

      Here are the color codes:
      Red = 1       Yellow = 4
      Green = 2     Cyan = 5
      Blue = 3      Purple = 6

      The code maker will choose four to create a 'master code'. For example,
      'Red, Blue, Green, Red' can be typed as: '1 3 2 1' (Without the '')
      As you can see, there can be more then one of the same color.

      In order to win, the code breaker needs to guess the 'master code' in 12 or less turns.

      Clues:
      After each guess, there will be up to four clues to help crack the code.
      $ This clue means you have 1 correct number at the correct location.
      ? This clue means you have 1 correct number, but at the wrong location.

      Example:
      To continue the example, using the above 'master code' a guess of "1 1 3 4" would produce 3 clues:
      Guess: ["1", "1", "3", "4"]    Clues: ["$", "?", "?"]

      The guess had 1 correct number at the correct location and 2 correct numbers at a wrong location.