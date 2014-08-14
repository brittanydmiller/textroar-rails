require 'faker'

FactoryGirl.define do
  factory :response do
    association :survey
    text { Faker::Lorem.words(3) }
    key { Faker::Lorem.characters(6) }
  end
end