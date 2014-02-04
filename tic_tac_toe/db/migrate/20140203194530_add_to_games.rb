class AddToGames < ActiveRecord::Migration
  def change
    add_column :games, :name, :string
    add_column :games, :rating, :integer

    add_column :games, :description, :text

    add_column :games, :win, :integer
    add_column :games, :loss, :integer

  end
end
