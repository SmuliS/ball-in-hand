require 'spec_helper'

describe Game do
  describe "#record" do
    let(:p1) { create(:player) }
    let(:p2) { create(:player) }

    it "should record a game" do
      expect {
        Game.record "EightBall", p1, p2
      }.to change{Game.count}.by(1)
    end

    it "should create result for each player" do
      expect {
        Game.record "EightBall", p1, p2
      }.to change{Result.count}.by(2)
    end

    it "should change player ratings" do
      Game.record "EightBall", p1, p2

      p1.reload.rating.should be > p2.reload.rating
    end

    it "should change player's played games count" do
      expect {
        Game.record "EightBall", p1, p2
      }.to change{p1.reload.games_played}.by(1)
    end

    it "should create correct result data" do
      Game.record "EightBall", p1, p2

      p1.results.last.won.should be_true
      p2.results.last.won.should be_false
    end
  end
end
