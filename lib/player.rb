# frozen_string_literal: true

# to play game for user
class PlayerGame
  def initialize(code_array)
    @code_array = code_array.to_s.split('')
    @guess_attempt_array = []
    @show_hint_array = []
  end

  def play
    ask_for_code_user
    compare_guess
    guess_response

    # used explicit return because need to make sure that method returns it
    @show_hint_array
  end

  def ask_for_code_user
    puts 'Enter your guess. (Range 1111 - 6666)'

    # validate entry
    @selection_guess = 0
    until (@selection_guess >= 1111) && (@selection_guess <= 6666)
      @selection_guess = gets.chomp.to_i
      unless @selection_guess >= 1111 && @selection_guess <= 6666
        puts 'Invalid selection. Choose a number between 1111 - 6666'
      end
      @guess_attempt_array = @selection_guess.to_s.split('')
    end
  end

  def compare_guess
    i = 0
    @code_array.each do |element|
      if @guess_attempt_array.include?(element) && @guess_attempt_array[i] == element
        @show_hint_array.push('X')
      elsif @guess_attempt_array.include?(element) && @guess_attempt_array[i] != element
        @show_hint_array.push('O')
      end
      i += 1
    end
  end

  def guess_response
    puts 'Output:'
    puts @show_hint_array.join('')
  end
end
