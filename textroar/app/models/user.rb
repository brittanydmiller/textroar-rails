class User < ActiveRecord::Base
  has_many :surveys
  has_many :responses, through: :surveys
  attr_accessible :username, :password_hash, :phone, :email
  validates :username, :password_hash, :email, :phone, presence: true
  validates :username, :email, :phone, uniqueness: true
end