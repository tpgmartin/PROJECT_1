class AddToUsers < ActiveRecord::Migration
  def change
    add_column :users, :name, :string
    add_column :users, :email, :string
    add_column :users, :password_digest, :string
    add_column :users, :role, :string

    add_column :users, :description, :text
    add_column :users, :sex, :string
    add_column :users, :address, :string

    add_column :users, :win, :integer
    add_column :users, :loss, :integer
  end
end
