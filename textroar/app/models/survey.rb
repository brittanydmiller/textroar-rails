class Survey < ActiveRecord::Base
  has_many :responses
  has_many :votes
  belongs_to :user
  attr_accessible :title, :descr, :vote_start, :vote_end, :poll_key, :phone, :user_id, :latitude, :longitude
  validates :title, :poll_key, :phone, :user_id, presence: true
  validates :poll_key, uniqueness: true

  def lat_long
    [latitude, longitude]
  end
end