class AddGameIdPlayerIdToMoves < ActiveRecord::Migration
  def change
    add_column :moves, :player_id, :integer
    add_column :moves, :game_id, :integer
    add_column :moves, :position, :integer
    add_column :moves, :token, :string
  end
end
