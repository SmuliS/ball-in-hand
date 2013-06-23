# Read about factories at https://github.com/thoughtbot/factory_girl
require 'factory_girl'
require 'faker'

FactoryGirl.define do
  factory :player do
    name Faker::Name.name
  end
end
