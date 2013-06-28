require 'spec_helper'

describe Player do
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
