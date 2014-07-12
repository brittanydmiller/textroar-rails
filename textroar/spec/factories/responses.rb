require 'faker'

FactoryGirl.define do
  factory :response do
    association :survey
    response_text { Faker::Lorem.words(3) }
    response_key { Faker::Lorem.characters(6) }
  end
end