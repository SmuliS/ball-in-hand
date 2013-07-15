# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :player do
    name {Faker::Name.name}
    secret_key {Faker::Lorem.characters 10}
  end
end
