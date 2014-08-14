class User < ActiveRecord::Base
  has_many :surveys
  has_many :responses, through: :surveys
  has_secure_password
  # validates_presence_of :password, :on => :create
  attr_accessible :username, :password, :password_confirmation, :phone, :email
  validates :username, :email, :phone, presence: true
  validates :username, :email, :phone, uniqueness: true
end