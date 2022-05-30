# GameDisplay handles what to display on the command line screen
module GameDisplay
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

  def game_screen
    puts display_color_numbers
    case user_gameplay_choice
    when 1
      # maker_gameplay
    when 2
      breaker_gameplay
    end
  end
end