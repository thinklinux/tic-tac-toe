def draw_board(state)
  state.each_char.with_index do |cell, index|
    print ' ' if (index % 3).zero?
    print cell
    print ' | ' unless index % 3 == 2
    print "\n-----------\n" if index % 3 == 2 && index < 6
  end
  puts "\n\n"
end
