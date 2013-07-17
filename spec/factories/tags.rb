FactoryGirl.define do
  factory :tag do
    sequence(:name) {|num| "Tag ##{num}"}
  end
end
