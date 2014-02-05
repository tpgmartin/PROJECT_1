class Game < ActiveRecord::Base
  # attr_accessible :name, :rating, :description, :win, :loss

  attr_reader :board

  belongs_to :user1, class_name: 'User'
  belongs_to :user2, class_name: 'User'

  has_many :moves
  after_initialize :setup_initial_values

  
  def setup_initial_values
    @board = [ " ", " ", " ", " ", " ", " ", " ", " ", " " ]

    @turn = 0
    @winning_positions = [[0, 4, 8], [3, 4, 5], [1, 4, 7], [2, 4, 6], [0, 1, 2], [0, 3, 6], [6, 7, 8], [2, 5, 8]]

  end

  def populate_board
    moves = Move.where(game_id: :id)
    moves.each do |move|
      # @turn += 1
      @board[move.position] = move.token
    end
  end

  def make_move(user, position)
    raise "Game has finished" if game_is_finished?

    raise "Player has won" if hasWon?

    raise "Ends in a tie" if game_is_finished? && hasWon? == false

    raise "Incorrect user" unless [ user1_id, user2_id ].include?(user.id)

    raise "Wrong turn" unless whose_turn == user

    raise "Invalid position" unless position_in_bounds?(position)

    raise "Position #{position} is occupied" if position_is_occupied?(position)


    Move.create game_id: self.id, user_id: user.id, position: position, token: which_token_next


  end

  # def startWith
  #   @turn = 0
  # end

  def which_token_next
    moves.count.even? ? "X" : "O" 
    # if moves.count.even?
    #   return "x"
    # else
    #   return "o"
    # end
  end

  def position_is_occupied?(position)
    @board[position] != " "

  end

  def moves_made_array
    moves.each do |move|
      @board[move.position] = move.token
    end
  end

  def game_is_finished?
    !@board.include?(" ")  
  end

  def whose_turn
    moves.count.even? ? user1 : user2
  end

  def position_in_bounds?(position)
    (0..8).include?(position)
  end

  def hasWon?
    user = nil
    @winning_positions.each { |a|
      user = @board[a[0]]
      if user != " " && (@board[a[0]] == @board[a[1]]) && (@board[a[1]] == @board[a[2]])
        puts "Congratulations " + user + " you have won!"
        return user
        gets
        @board = [ " ", " ", " ", " ", " ", " ", " ", " ", " " ]  
        Game.new
      end
    }
    return false
  end

end
