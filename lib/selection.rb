# frozen_string_literal: true

# requests the selection to be a code maker or code breaker
class Selection
  attr_reader :selection

  def initialize
    introduction
  end

  private

  def introduction
    puts "Welcome to the game of mastermind!\nPlease choose your path.\n[1]Code Maker\n[2]Code Breaker"
    request_selection
  end

  def request_selection
    @selection = 0
    until @selection == 1 || @selection == 2
      @selection = gets.chomp.to_i
      puts 'Invalid input. Try again' if @selection != 1 && @selection != 2
    end
  end
end
