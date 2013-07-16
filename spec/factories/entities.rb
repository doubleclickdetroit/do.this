FactoryGirl.define do
  factory :entity do
    sequence(:title) {|num| "Entity #{num}"} 
    note "Note\nText"
    time "2013-07-16 02:28:29"
    date "2013-07-16"
    user nil
  end
end
