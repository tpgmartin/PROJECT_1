class ChangePlayerIdToUserIdInMoves < ActiveRecord::Migration
  def change
    remove_column :moves, :player_id, :integer
    add_column :moves, :user_id, :integer
  end
end
