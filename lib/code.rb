# frozen_string_literal: true

require_relative('selection')

# initiates selection and returns code based on maker or breaker selection
class Code
  # 1 is for maker and 2 is for breaker
  # on maker. user will choose a number
  # on breaker. pc will choose a number
  attr_reader :user_or_pc, :secret_code_selected

  def initialize
    take_code
  end

  private

  def take_code
    @maker_or_breaker = Selection.new.selection
    maker_selected if @maker_or_breaker == 1
    breaker_selected if @maker_or_breaker == 2
  end

  @secret_code_selected = 0
  @user_or_pc = nil

  def maker_selected
    @secret_code = 0
    puts 'Enter a code. (Range = 1111 - 6666)'
    until (@secret_code >= 1111) && (@secret_code <= 6666)
      @secret_code = gets.chomp.to_i
      puts 'Invalid selection. Choose a number betwee 1111 - 6666' unless @secret_code >= 1111 && @secret_code <= 6666
    end
    @secret_code_selected = @secret_code
    @user_or_pc = 'pc_player'
  end

  def breaker_selected
    @secret_code_selected = rand(1111...6666)
    @user_or_pc = 'user_player'
  end
end
