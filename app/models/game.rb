class Game < ActiveRecord::Base
  belongs_to :winner, class_name: "Player", :foreign_key => "winner_id"
  belongs_to :loser, class_name: "Player", :foreign_key => "loser_id"

  validates :winner, :presence => true
  validates :loser, :presence => true
  validates :loser_rating, :presence => true
  validates :winner_rating, :presence => true
  validates :type, :presence => true
end