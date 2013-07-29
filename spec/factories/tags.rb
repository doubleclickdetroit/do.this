FactoryGirl.define do
  factory :tag do
    sequence(:name) {|num| "tag-#{num}"}
  end
end
