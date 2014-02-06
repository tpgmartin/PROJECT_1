# class TicTacToe

  require "color_text"

  # def initialize
    @board = [ " ", " ", " ", " ", " ", " ", " ", " ", " " ]
    @turn = 0
    @winning_positions = [[0, 4, 8], [3, 4, 5], [1, 4, 7], [2, 4, 6], [0, 1, 2], [0, 3, 6], [6, 7, 8], [2, 5, 8]]
  # end

  def menu
    print `clear`
    puts "***Ruby TicTacToe***"
    print "Choose to (p)lay the game or (q)uit: "
    gets.chomp.downcase
  end

  def boardNotFull?
    @board.include?(" ")    
  end

  def startWith
    @turn = rand(2)
  end

  def turn
    @turn % 2 == 0 ? "X" : "O" 
  end

  def renderGrid
    puts
    puts "Use this grid as a reference"
    puts
    puts "\t1 | 2 | 3"
    puts "\t- + - + -"
    puts "\t4 | 5 | 6"
    puts "\t- + - + -"
    puts "\t7 | 8 | 9"
  end

  def renderBoard
    puts 
    puts "\t#{@board[0]} | #{@board[1]} | #{@board[2]}"
    puts "\t- + - + -"
    puts "\t#{@board[3]} | #{@board[4]} | #{@board[5]}"
    puts "\t- + - + -"
    puts "\t#{@board[6]} | #{@board[7]} | #{@board[8]}"
    puts
  end

  def game

    winning_position = false
    while winning_position == false && boardNotFull?     
      nextTurn
      winning_position = hasWon?      
    end
    renderBoard
    puts "Nobody won!" if !winning_position && boardNotFull? == false
    gets
    @board = [ " ", " ", " ", " ", " ", " ", " ", " ", " " ]
    menu
  end

  def nextTurn
    who = turn
    print `clear`      
    renderGrid
    renderBoard                 
    print who + "'s turn. " 

    choice = ""
    while choice == "" do
      choice = gets.chomp.to_i
      if @board[choice - 1] != " "
        puts "There is already a #{@board[choice - 1]} there!, choose another: "
        choice = ""
      end
    end

    @board[choice - 1] = turn.upcase     
    @turn += 1                  
  end

  def hasWon?
    player = nil
    @winning_positions.each { |a|
      player = @board[a[0]]
      if player != " " && (@board[a[0]] == @board[a[1]]) && (@board[a[1]] == @board[a[2]])
        puts "Congratulations " + player + " you have won!"
        return player
        gets
        @board = [ " ", " ", " ", " ", " ", " ", " ", " ", " " ]
        menu
      end
    }
    return false
  end

    response = menu

  while response != 'q'
    case response
    when 'p'
      game 
    end
   
    response = menu
  end

# end

