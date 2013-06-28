require 'spec_helper'

describe GamesController do
  describe "#create" do
    let(:p1) {create(:player)}
    let(:p2) {create(:player)}
    it "should create game" do
      expect{
        post :create, winner: p1.name, loser: p2.name, game_type: "EightBall"
      }.to change{Game.count}.by(1)
    end

    it "should redirect to main page" do
      post :create, winner: p1.name, loser: p2.name, game_type: "EightBall"

      response.should redirect_to("/")
    end
  end
end
