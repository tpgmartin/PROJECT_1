class Game < ActiveRecord::Base
  attr_accessible :name, :rating, :description, :win, :loss, :user_id

  has_and_belongs_to_many :users

  has_many :moves

end
