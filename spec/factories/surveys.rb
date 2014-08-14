require 'faker'

FactoryGirl.define do
  factory :survey do
    association :user
    title { Faker::Lorem.sentence(4) }
    descr { Faker::Lorem.sentence(8) }
    vote_start 'Thurs, 08 May 2014 00:29:23 +0000'
    vote_end 'Fri, 09 May 2014 00:29:23 +0000'
    poll_key { Faker::Lorem.characters(5)}
    sequence(:phone) {|n| "55#{n}5555555".truncate(10)} 
    latitude { Faker::Address.latitude }
    longitude { Faker::Address.longitude }
    factory :invalid_survey do
      title nil
      poll_key nil
    end
  end
end