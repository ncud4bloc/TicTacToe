module Actions

  def sequence
    start
    @t0board = [["r1c1", "r1c2", "r1c3"],["r2c1", "r2c2", "r2c3"],["r3c1", "r3c2", "r3c3"]]
    @@board = [["*", "*", "*"],["*", "*", "*"],["*", "*", "*"]]
    @@linewidth = 25
    puts " "
    puts "#{@t0board[0][0]}   #{@t0board[0][1]}   #{@t0board[0][2]}".center(@@linewidth)
    puts " "
    puts "#{@t0board[1][0]}   #{@t0board[1][1]}   #{@t0board[1][2]}".center(@@linewidth)
    puts " "
    puts "#{@t0board[2][0]}   #{@t0board[2][1]}   #{@t0board[2][2]}".center(@@linewidth)
    puts " "
    
    @i = 0
    until @victory == "true"
      if @i.even? 
        @player = @plyr1
        @mark = "X"
      else
        @player = @plyr2
        @mark = "O" 
      end
      turns
      status
      @i += 1
    end
  end

  def start
    puts " "
    puts "-----------------------"
    puts "     Tic-Tac-Toe!"
    puts "-----------------------"
    puts " "
    puts "Enter Player 1 Name:"
    @plyr1 = gets.chomp.downcase
    puts "Enter Player 2 Name:"
    @plyr2 = gets.chomp.downcase
    puts " "
    puts "Welcome players!  #{@plyr1.capitalize} will be \"X\" and #{@plyr2.capitalize} will be \"O\"."
  end
  
  def turns
    valid = true
    while valid
    puts "#{@player.capitalize}, please enter row:"
    @t_row = gets.chomp.to_i
    puts "Now enter column:"
    @t_column = gets.chomp.to_i
      
      if @t_row > 3 || @t_column > 3
        puts "That\'s not a valid entry. Enter new row/column selection"
        valid = true
      elsif @@board[@t_row -1][@t_column -1] == "X" || @@board[@t_row -1][@t_column -1] == "O"
        puts "That spot\'s already taken. Enter new row/column selection"
        valid = true
      else
        valid = false
      end
      
    end 
    
    @@board[@t_row -1][@t_column -1] = @mark
    puts " "
    puts "#{@@board[0][0]}   #{@@board[0][1]}   #{@@board[0][2]}".center(@@linewidth)
    puts " "
    puts "#{@@board[1][0]}   #{@@board[1][1]}   #{@@board[1][2]}".center(@@linewidth)
    puts " "
    puts "#{@@board[2][0]}   #{@@board[2][1]}   #{@@board[2][2]}".center(@@linewidth)
    puts " "
  end

  def status
    if (@@board[0][0] != "*" &&  @@board[0][0] == @mark && @@board[0][1] != "*" &&  @@board[0][1] == @mark && @@board[0][2] != "*" &&  @@board[0][2] == @mark)                                             || (@@board[1][0] != "*" &&  @@board[1][0] == @mark && @@board[1][1] != "*" &&  @@board[1][1] == @mark && @@board[1][2] != "*" &&  @@board[1][2] == @mark)                                             || (@@board[2][0] != "*" &&  @@board[2][0] == @mark && @@board[2][1] != "*" &&  @@board[2][1] == @mark && @@board[2][2] != "*" &&  @@board[2][2] == @mark)                                             || (@@board[0][0] != "*" &&  @@board[0][0] == @mark && @@board[1][0] != "*" &&  @@board[1][0] == @mark && @@board[2][0] != "*" &&  @@board[2][0] == @mark)                                             || (@@board[0][1] != "*" &&  @@board[0][1] == @mark && @@board[1][1] != "*" &&  @@board[1][1] == @mark && @@board[2][1] != "*" &&  @@board[2][1] == @mark)                                             || (@@board[0][2] != "*" &&  @@board[0][2] == @mark && @@board[1][2] != "*" &&  @@board[1][2] == @mark && @@board[2][2] != "*" &&  @@board[2][2] == @mark)                                             || (@@board[0][0] != "*" &&  @@board[0][0] == @mark && @@board[1][1] != "*" &&  @@board[1][1] == @mark && @@board[2][2] != "*" &&  @@board[2][2] == @mark)                                             || (@@board[2][0] != "*" &&  @@board[2][0] == @mark && @@board[1][1] != "*" &&  @@board[1][1] == @mark && @@board[0][2] != "*" &&  @@board[0][2] == @mark)
      @victory = "true"
      puts " "
      puts "#{@player.capitalize} wins!!"
      puts " "
    else   
      @victory = "false"
    end
    
    if @i > 7
      puts "Stalemate...game is a tie"
      @victory = "true"
    end
  end
  
end

class Gameplay
  include Actions
end

ttt = Gameplay.new
ttt.sequence