class Move < ActiveRecord::Base
  belongs_to :player, class_name: 'User'
  belongs_to :game
  attr_accessible :square, :symbol, :game_id, :player_id


end
