# frozen_string_literal: true

# module GameInstructions contains display instructions for the game
module GameInstructions
  def display_instructions
    <<~HEREDOC

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
        'Red, Blue, Green, Red' can be typed as: '1321' (Without the '')

      As you can see, there can be more then one of the same color.
      In order to win, the code breaker needs to guess the 'master code' in 12 or less turns.

      Clues:
      After each guess, there will be up to four clues to help crack the code.

        $ This clue means you have 1 correct number in the correct location.
        ? This clue means you have 1 correct number, but in the wrong location.

      Example:
      To continue the example, using the above 'master code' a guess of "1134" would produce 3 clues:
        1 1 3 4  Clues: $ ? ?

      The guess had 1 correct number in the correct location and 2 correct numbers in a wrong location.

      When you are ready,
        Type '1' to be the MAKER
        Type '2' to be the BREAKER

    HEREDOC
  end

  def display_color_numbers
    <<~HEREDOC
      Color Codes:
        Red = 1
        Green = 2
        Blue = 3
        Yellow = 4
        Cyan = 5
        Purple = 6

    HEREDOC
  end

  def instruction_screen
    puts display_instructions
    until valid_gameplay_choice?
      print 'Choose your Gameplay Style: '
      @user_gameplay_choice = gets.chomp.to_i
    end

    system('clear')
  end

  def valid_gameplay_choice?
    user_gameplay_choice == 1 || user_gameplay_choice == 2
  end
end
