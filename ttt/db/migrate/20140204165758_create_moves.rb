class CreateMoves < ActiveRecord::Migration
  def change
    create_table :moves do |t|
      t.references :player
      t.references :game
      t.integer :square
      t.string :symbol

      t.timestamps
    end
    add_index :moves, :player_id
    add_index :moves, :game_id
  end
end
