class Result < ActiveRecord::Base
  belongs_to :player
  belongs_to :game
  attr_accessible :rating_after, :won, :player, :game
end
