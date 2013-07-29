FactoryGirl.define do
  factory :story do
    sequence(:title) {|n| "Story Title ##{n}"}
    description "Story\nDescription"
  end
end
