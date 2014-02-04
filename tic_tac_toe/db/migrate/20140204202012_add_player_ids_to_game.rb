class AddPlayerIdsToGame < ActiveRecord::Migration
  def change
    add_column :games, :user1_id, :integer
    add_column :games, :user2_id, :integer
  end
end
