class Result < ActiveRecord::Base
  belongs_to :player
  belongs_to :game
  attr_accessible :rating_after, :won, :player, :game

  def opponent
    game.result.find { |r| r.player != player }.player
  end
end
