# frozen_string_literal: true

require_relative('code')
require_relative('mastermind')
require_relative('player')
require_relative('selection')

get_code_for_game = Code.new
# p get_code_for_game.secret_code_selected
game_play_mastermind = MasterMind.new(get_code_for_game.user_or_pc, get_code_for_game.secret_code_selected)
game_play_mastermind.play_game
