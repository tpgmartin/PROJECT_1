class Move < ActiveRecord::Base
  attr_accessible :game_id, :player_id, :position, :token

  belongs_to :game

  # Check if move legal
end
