# frozen_string_literal: true

require_relative('code')
require_relative('player')

# takes code and maker_or_breaker selection and
# plays the game
class MasterMind
  def initialize(player, code)
    @player = player
    @code = code
  end

  @code_to_guess = @code.to_s.split('')

  def play_game
    user_plays_game if @player == 'user_player'
    pc_plays_game if @player == 'pc_player'
  end

  def user_plays_game
    @attempts_player = 0
    @guessed_player = false
    until @attempts_player == 12 || @guessed_player == true
      @player_game = PlayerGame.new(@code).play
      condition_check_game_player(@player_game)
    end
  end

  def pc_plays_game
    # p "Pc plays game works with code #{@code}"
  end

  def condition_check_game_player(output_array)
    if output_array.join('') == 'XXXX'
      @guessed_player = true
      puts "Congrats! You guessed the code #{@code} in #{1 + @attempts_player} attempts"
    else
      @attempts_player += 1
      puts "#{12 - @attempts_player} attempts left"
      puts "You failed to break the code. The code is #{@code}." if @attempts_player == 12
    end
  end
end
