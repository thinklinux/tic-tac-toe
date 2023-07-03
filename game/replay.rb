require_relative 'clear_board'

def replay_game(replay_file)
  if File.exist?(replay_file) == false
    puts "File #{replay_file} does not exist!"
    exit
  end

  File.open(replay_file, 'r') do |file|
    file.each_line do |line|
      clear_board(6)
      draw_board(line.strip)
      sleep(1)
    end
  end
end
