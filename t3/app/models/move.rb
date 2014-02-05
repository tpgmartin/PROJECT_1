class Move < ActiveRecord::Base
  attr_accessible :game_id, :user_id, :position, :token

  belongs_to :user, class_name: 'User'
  belongs_to :game

end
