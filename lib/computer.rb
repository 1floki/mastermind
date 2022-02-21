# frozen_string_literal: true

# computer plays the game
class ComputerPlay
  def initialize(code)
    @code = code
    @code_array = code.to_s.split('')
    init_arr_and_var
  end

  def init_arr_and_var
    @show_hint_array = []
    @guess_attempt_array = []
    @current_number = 0
    @found_enteries = []
    @attempts = 0
  end

  def play_game
    find_four_numbers
    find_right_combo
  end

  def find_four_numbers
    until @found_enteries.count == 4
      start_guessing
      compare_guess
      check_count_and_add
      @attempts += 1
    end
  end

  def find_right_combo
    until @show_hint_array.join('') == 'XXXX'
      @show_hint_array = []
      @guess_attempt_array = @found_enteries.shuffle!
      compare_guess
      @attempts += 1
      puts "Computer guessed: #{@guess_attempt_array.join('')}"
    end
    puts "Computer has broken your secret code: #{@found_enteries.join('')} in #{@attempts} attempts!"
    puts 'But it lost because it guessed in more than 12 attempts' if @attempts > 12
  end

  def start_guessing
    @guess_attempt_array = Array.new((4 - @found_enteries.length), @current_number.to_s) << @found_enteries
    puts "Computer guessed: #{@guess_attempt_array.join('')}"
  end

  def check_count_and_add
    @count_exits = @show_hint_array.count('X') + @show_hint_array.count('O')

    @found_enteries.push(Array.new(@count_exits, @current_number.to_s)) unless @count_exits.zero?

    @found_enteries.flatten!
    @current_number += 1
    @show_hint_array = []
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
    puts "Output:\n#{@show_hint_array.join('')}\n"
  end
end
