FactoryGirl.define do
  factory :comment do
    sequence(:body) {|n| "Body test for comment ##{n}."}
    user nil
    entity nil
  end
end
