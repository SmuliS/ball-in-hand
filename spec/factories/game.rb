require 'factory_girl'
require 'faker'

FactoryGirl.define do
  factory :game do
    winner factory: :player
    loser factory: :player
    winner_rating  { rand(1500..1600) }
    loser_rating { rand(1500..1600) }
    type { "8-ball" }
  end
end