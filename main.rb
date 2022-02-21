# frozen_string_literal: true

require_relative('lib/code')
require_relative('lib/mastermind')
require_relative('lib/player')
require_relative('lib/selection')

get_code_for_game = Code.new
game_play_mastermind = MasterMind.new(get_code_for_game.user_or_pc, get_code_for_game.secret_code_selected)
game_play_mastermind.play_game
