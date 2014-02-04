class Game < ActiveRecord::Base
  attr_accessible :name, :rating, :description, :win, :loss

  belongs_to :user1, class_name: 'User'
  belongs_to :user2, class_name: 'User'

  has_many :moves

  def make_move(user, square)
    raise "Game has finished" if game_is_finished?

    raise "Incorrect user" unless [ user1_id, user2_id ].include?(user.id)

    raise "Wrong turn" unless whose_turn == user

    raise "Invalid position" unless position_in_bounds?

    raise "Position is occupied" if position_is_occupied?(position)

    Move.create game_id: self.id, user_id: user.id, position: position, token: which_token_next
  end

  def which_token_next
    moves.count.even? ? 'X' : 'O'
  end

  def position_is_occupied?(position)
    moves_made_array[position]
  end

  def moves_made_array
    a = [ nil, nil, nil, nil, nil, nil, nil, nil, nil]    

    moves.each do |move|
      a[move.position] = move.token
    end
  end

  def game_is_finished?
    false
  end

  def whose_turn
    
  end

  def position_in_bounds?(position)
    (0..8).include?(position)
  end


end
