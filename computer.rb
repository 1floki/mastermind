# frozen_string_literal: true

# computer plays the game
class ComputerPlay
  def initialize(code)
    @code = code
    @code_array = code.to_s.split('')
    @guess_attempt_array = []
    @show_hint_array = []
  end

  def play_game
    @attempts = 0
    @gussed = false
    # until @attemps == 12 || @guessed == false
    #   computer_makes_guess
    #   compare_guess
    # end

    computer_makes_guess
    compare_guess
    p @show_hint_array
  end

  def computer_makes_guess
    if @show_hint_array.empty?
      not_second_move
    else
      not_second_move
    end
  end

  def not_second_move
    case @show_hint_array.count('X') + @show_hint_array.count('O')
    when 1
      contains_at_least_one
    when 2
      contains_at_least_two
    when 3
      contains_at_least_three
    when 4
      contains_at_least_four
    end
  end

  def compare_guess
    i = 0
    @show_hint_array = []
    @code_array.each do |element|
      if @guess_attempt_array.include?(element) && @guess_attempt_array[i] == element
        @show_hint_array.push('X')
      elsif @guess_attempt_array.include?(element) && @guess_attempt_array[i] != element
        @show_hint_array.push('O')
      end
      i += 1
    end
  end

  def first_move
    # when the hint array is empty
    p "going first"
  end

  def contains_at_least_one
    # when contains at least one correct number
    @guess_attempt_array = 1555.to_s.split('')
    p "works till here"
  end

  def contains_at_least_two
    # when contains at least two correct number
  end

  def contains_at_least_three
    # when contains at least three correct number
  end

  def contains_at_least_four
    # when contains at least one correct number
  end
end

game = ComputerPlay.new(1234)
game.play_game
