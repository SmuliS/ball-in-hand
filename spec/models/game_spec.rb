require 'spec_helper'

describe Game do
  it "should have valid factory" do
    build(:game).should be_valid
  end
  describe "validations -" do
    it "should validate presence of winner" do
      build(:game, winner: nil).should_not be_valid
    end
    it "should validate presence of player2" do
      build(:game, loser: nil).should_not be_valid
    end
    it "should validate presence of player2" do
      build(:game, winner_rating: nil).should_not be_valid
    end
    it "should validate presence of player2" do
      build(:game, loser_rating: nil).should_not be_valid
    end
    it "should validate presence of player2" do
      build(:game, type: nil).should_not be_valid
    end
  end
end