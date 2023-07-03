def clear_board(rows)
  rows.times do
    print "\x1B[1A\x1B[2K" # move up and clear
    # print "\x1B[1A" # move up
  end
end
