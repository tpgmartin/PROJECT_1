class Game < ActiveRecord::Base
  belongs_to :player1, class_name: 'User'
  belongs_to :player2, class_name: 'User'
  attr_accessible :name
  has_many :moves

  def make_move(player, square)
    raise "game is finished" if game_is_finished?

    # raise "you're not my player!" unless [player1_id, player2_id].include?(player.id)

    raise "it's not your turn" unless whose_turn == player

    raise "square isn't valid" unless square_is_in_bounds?
      
    raise "square is occupied" if square_is_occpied?(square)

    Move.create game_id: self.id, player_id: player.id, square: square, symbol: which_symbol_next
  end

  private
  def which_symbol_next
      moves.count.even? ? 'X' : 'O'
  end

  private
  def square_is_occupied?(square)
    moves_made_array[square]
  end

  public
  def moves_made_array
    a = [nil,nil,nil,nil,nil,nil,nil,nil,nil]

    moves.each do |move|
      a[move.square] = move.symbol
    end
  end

  public
  def game_is_finished?
    false # todo: write some code! Check whether game is won or tied.
    
  end

  private
  def whose_turn
    # todo: write some code to return the next player ...
  end

  private
  def square_is_in_bounds?(square)
    (0..8).include?(square)
  end
end
