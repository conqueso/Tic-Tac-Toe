board = [[' ', ' ', ' '], [' ', ' ', ' '], [' ', ' ', ' ']]


def show(board)
  dashes = 1
  board.each do |line|
    10.times {print ' '}
    bars = 1
    line.each do |e|
      print e
      print '|' if bars < 3
      bars += 1
    end
    puts
    10.times {print ' '}
    print '- - - ' if dashes < 3
    puts
    dashes += 1
  end
end

puts
puts
show(board)
puts
puts

move_count = 1
p = 'X'

loop do
  if  ((board[0][0] == board[0][1] && board[0][1] == board[0][2]) && board[0][2] != ' ') or
      ((board[1][0] == board[1][1] && board[1][1] == board[1][2]) && board[1][2] != ' ') or
      ((board[2][0] == board[2][1] && board[2][1] == board[2][2]) && board[2][2] != ' ') or
      ((board[0][0] == board[1][0] && board[1][0] == board[2][0]) && board[2][0] != ' ') or
      ((board[0][1] == board[1][1] && board[1][1] == board[2][1]) && board[2][1] != ' ') or
      ((board[0][2] == board[1][2] && board[1][2] == board[2][2]) && board[2][2] != ' ') or
      ((board[0][0] == board[1][1] && board[1][1] == board[2][2]) && board[2][2] != ' ') or
      ((board[2][0] == board[1][1] && board[1][1] == board[0][2]) && board[0][2] != ' ')
    puts
    puts "#{p}s win!!!!!!!!"
    puts
    show(board)
    break
  elsif board[0][0] != ' ' && board[0][1] != ' ' && board[0][2] != ' ' &&
        board[1][0] != ' ' && board[1][1] != ' ' && board[1][2] != ' ' &&
        board[2][0] != ' ' && board[2][1] != ' ' && board[2][2] != ' ' 
    puts
    puts "the game has ended in a draw"
    puts
    show(board)
    break
  end
      
  if move_count.odd?
    p = 'X'
  else
    p = 'O'
  end

 loop do
    puts
    puts "Player #{p} enter a column number from 1-3:"
    $c = gets.chomp.to_i
    if $c > 0 && $c < 4
      break
    end
    puts
    puts
    puts "****please enter a valid column number****"
    puts
    puts
  end

  loop do
    puts
    puts "Player #{p} enter a row number from 1-3:"
    $r = gets.chomp.to_i
    if $r > 0 && $r < 4
      break
    end
    puts
    puts
    puts "****please enter a valid row number**** "
    puts
    puts
  end

  location = board[($r-1)][$c-1]

  if location != ' '
    puts
    puts
    puts "you can't go there!!!!!!!!"
    puts
    puts
  else
    board[($r-1)][$c-1] = p
    move_count += 1  
  end
  
  show(board)

end
