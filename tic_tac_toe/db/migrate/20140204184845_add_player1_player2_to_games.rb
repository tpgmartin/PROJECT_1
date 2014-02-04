class AddPlayer1Player2ToGames < ActiveRecord::Migration
  def change
    add_column :games, :player1, :integer
    add_column :games, :player2, :integer
  end
end
