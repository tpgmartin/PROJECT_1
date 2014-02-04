class User < ActiveRecord::Base
  attr_accessible :name, :email, :password_digest, :password, :password_confirmation, :role, :description, :sex, :address, :win, :loss

  has_many :games

  # has_many :moves, through: :game

  validates :name, presence: true
  validates :email, presence: true
  validates :email, uniqueness: true
  validates :password, presence: true

  before_validation :set_default_role

  def role?
    self.role.to_s == role.to_s
  end

  private
  def set_default_role
    self.role ||= :user
  end
end
