FactoryGirl.define do
  factory :user do
    sequence(:name)  {|n| "User ##{n}"}
    sequence(:email) {|n| "user#{n}@example.com"}
    password 'asdfasdf'
    password_confirmation 'asdfasdf'
  end
end
