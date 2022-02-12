require_relative('code')

# takes code and maker_or_breaker selection and
# plays the game

class MasterMind
    def initialize(player, code)
        @player = player
        @code = code
    end

    def play_game
        user_plays_game if @player == 'user_player'
        pc_plays_game if @player == 'pc_player'
    end

    def user_plays_game

    end

    def pc_plays_game
    end
end