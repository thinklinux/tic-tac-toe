#!/usr/bin/env ruby
require_relative 'constants'
require_relative 'cli_options'
require_relative 'game/game_loop'
require_relative 'game/replay'

if @options[:replay]
  replay_game(@options[:replay])
  exit
end

puts "Let's play!\n\n"

game_loop
