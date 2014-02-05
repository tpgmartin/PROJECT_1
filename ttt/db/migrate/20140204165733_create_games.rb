class CreateGames < ActiveRecord::Migration
  def change
    create_table :games do |t|
      t.references :player1
      t.references :player2
      t.string :name

      t.timestamps
    end
    add_index :games, :player1_id
    add_index :games, :player2_id
  end
end
