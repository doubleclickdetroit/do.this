# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :entity do
    title "MyString"
    note "MyText"
    time "2013-07-16 02:28:29"
    date "2013-07-16"
    user nil
  end
end
