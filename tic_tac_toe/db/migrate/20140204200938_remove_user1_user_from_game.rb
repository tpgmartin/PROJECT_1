class RemoveUser1UserFromGame < ActiveRecord::Migration
  def change
    remove_column :games, :user1, :integer
    remove_column :games, :user2, :integer
  end
end
