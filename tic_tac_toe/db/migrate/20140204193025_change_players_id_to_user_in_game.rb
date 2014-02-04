class ChangePlayersIdToUserInGame < ActiveRecord::Migration
  def change
    remove_column :games, :player1, :integer
    remove_column :games, :player2, :integer
    add_column :games, :user1, :integer
    add_column :games, :user2, :integer
  end
end
