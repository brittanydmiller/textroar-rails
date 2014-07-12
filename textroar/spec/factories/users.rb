FactoryGirl.define  do
  factory :user do
    sequence(:username) {|n| "elena#{n}"}
    password_hash "gopro"
    sequence(:phone) {|n| "55#{n}5555555".truncate(10)} 
    sequence(:email) {|n| "elena#{n}@example.com"}
  end
end