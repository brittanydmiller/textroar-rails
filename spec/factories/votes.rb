require 'faker'

FactoryGirl.define do 
  factory :vote do
    association :survey
    sequence(:phone) {|n| "55#{n}5555555".truncate(10)} 
    choice { Faker::Lorem.characters(6)}
    latitude { Faker::Address.latitude }
    longitude { Faker::Address.longitude }
    ticket { Faker::Lorem.characters(6)}
  end
  
end