# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :result do
    player nil
    won false
    rating_after 1
  end
end
