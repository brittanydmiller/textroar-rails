require 'faker'

FactoryGirl.define  do
  factory :user do
    sequence(:username) {|n| "elena#{n}"}
    password "gopro"
    sequence(:phone) {|n| "55#{n}5555555".truncate(10)} 
    email { Faker::Internet.email }
  end
end