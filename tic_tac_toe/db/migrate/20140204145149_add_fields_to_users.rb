class AddFieldsToUsers < ActiveRecord::Migration
  def change
    add_column :users, :password, :string
    add_column :users, :password_confirmation, :integer
  end
end
