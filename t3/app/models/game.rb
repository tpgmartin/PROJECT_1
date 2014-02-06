class Game < ActiveRecord::Base
  # attr_accessible :name, :rating, :description, :win, :loss
  attr_accessible :user2_id

  belongs_to :user1, class_name: 'User'
  belongs_to :user2, class_name: 'User'

  has_many :moves
  after_initialize :setup_initial_values

  def board
    moves_made_array
  end

  def setup_initial_values
    @turn = 0
    @winning_positions = [[0, 4, 8], [3, 4, 5], [1, 4, 7], [2, 4, 6], [0, 1, 2], [0, 3, 6], [6, 7, 8], [2, 5, 8]]
  end

  def make_move(user, position)
    Move.create game_id: self.id, user_id: user.try(:id), position: position, token: which_token_next
  end

  # def has_started?
  #   if board == [ " ", " ", " ", " ", " ", " ", " ", " ", " " ]
  # end

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
    moves_made_array[position] != " "

  end

  def moves_made_array
    board = [ " ", " ", " ", " ", " ", " ", " ", " ", " " ]

    moves.map do |move|
      board[move.position] = move.token
    end
    board
  end

  def game_is_finished?
    !moves_made_array.include?(" ")  
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
      user = moves_made_array[a[0]]
      if user != " " && (moves_made_array[a[0]] == moves_made_array[a[1]]) && (moves_made_array[a[1]] == moves_made_array[a[2]])
        puts "Congratulations " + user + " you have won!"
        return user
      end
    }
    return false
  end

end
