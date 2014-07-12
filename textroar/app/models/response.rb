class Response < ActiveRecord::Base
  belongs_to :user
  belongs_to :survey
  attr_accessible :survey_id, :response_text, :response_key
  validates :survey_id, :response_text, :response_key, presence: true
  validates :response_text, uniqueness: { scope: :survey_id }
  validates :response_key, uniqueness: { scope: :survey_id }
end