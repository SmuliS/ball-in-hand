require 'spec_helper'

describe Player do
  it "should have valid factory" do
    build(:player).should be_valid
  end
  describe "validations" do
    it "should have name" do
      build(:player, name: nil).should_not be_valid
    end
    it "should have secret_key" do
      build(:player, secret_key: nil).should_not be_valid
    end
  end
  describe "#rating" do
    let(:player) {build(:player)}
    before :each do
      create(:result, player: player, rating_after: 1500, won: true)
      create(:result, player: player, rating_after: 1800, won: true)
      create(:result, player: player, rating_after: 1750, won: false)
    end
    it "should return players last rating" do
      player.rating.should eq 1750
    end

    it "should return last played count" do
      player.games_played.should eq 3
    end

  end
end
