require_relative 'draw_board'
require_relative 'clear_board'
require_relative '../state/state'

def game_loop
  game_state = GameState.new
  rows_to_clear = 10

  draw_board(game_state.state)

  while game_state.check_win_condition == 'N'
    puts "Player #{game_state.current_player}: "
    puts "Enter a number between 1 and 9:\n\n"

    move = gets.chomp.to_i

    if game_state.valid_move?(move)
      game_state.insert_sign(move)
      game_state.next_player
      clear_board(rows_to_clear)
      rows_to_clear = 10
    else
      clear_board(rows_to_clear)
      rows_to_clear = 12
      puts "Invalid move!\n\n"
    end

    draw_board(game_state.state)
  end

  if game_state.check_win_condition == 'D'
    puts "It's a draw!\n\n"
  else
    puts "Player #{game_state.check_win_condition} won!\n\n"
  end

  game_state.save_replay
end
