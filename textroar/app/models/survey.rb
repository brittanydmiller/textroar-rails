class Survey < ActiveRecord::Base
  has_many :responses
  belongs_to :user
  attr_accessible :title, :descr, :vote_start, :vote_end, :poll_key, :phone, :user_id, :latitude, :longitude

  def lat_long
    [latitude, longitude]
  end
end