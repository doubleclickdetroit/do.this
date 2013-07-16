FactoryGirl.define do
  factory :entity do
    sequence(:title) {|num| "Entity #{num}"} 
    note "Note\nText"
    time { Time.now }
    date { Date.today }
    user nil
  end
end
