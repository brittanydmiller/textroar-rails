class Response < ActiveRecord::Base
  belongs_to :user
  belongs_to :survey
  attr_accessible :survey_id, :text, :key
  validates :survey_id, :text, :key, presence: true
  validates :text, uniqueness: { scope: :survey_id }
  validates :key, uniqueness: { scope: :survey_id }
end