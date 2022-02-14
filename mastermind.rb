# frozen_string_literal: true

require_relative('code')
require_relative('player')

# takes code and maker_or_breaker selection and
# plays the game
class MasterMind
  def initialize(player, code)
    @player = player
    @code = code
    @attempts = 0
    @guessed = false
  end

  @code_to_guess = @code.to_s.split('')

  def play_game
    user_plays_game if @player == 'user_player'
    pc_plays_game if @player == 'pc_player'
  end

  def user_plays_game
    until @attempts == 12 || @guessed == true
      @player_game = PlayerGame.new(@code).play
      condition_check_game
    end
  end

  def pc_plays_game; end

  def condition_check_game
    if @player_game.join('') == 'XXXX'
      @guessed = true
      puts "Congrats! You guessed the code #{@code} in #{1 + @attempts} attempts"
    else
      @attempts += 1
      puts "#{12 - @attempts} attempts left"
    end
  end
end

