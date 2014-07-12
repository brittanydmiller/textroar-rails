class Vote < ActiveRecord::Base
  belongs_to :survey
  attr_accessible :phone, :choice, :latitude, :longitude, :ticket, :survey_id
  validates :phone, uniqueness: { scope: :survey_id }
end