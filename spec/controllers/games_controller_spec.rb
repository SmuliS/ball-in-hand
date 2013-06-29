require 'spec_helper'

describe GamesController do
  describe "#index" do
    it "should return status code 200" do
      get :index
      response.status.should eq 200
    end
  end
  describe "#new" do
    it "should return status code 200" do
      get :new
      response.status.should eq 200
    end
  end
  describe "#create" do
    let(:p1) {create(:player)}
    let(:p2) {create(:player)}
    it "should create game" do
      expect{
        post :create, winner: p1.id, loser: p2.id, game_type: "EightBall"
      }.to change{Game.count}.by(1)
    end

    it "should redirect to main page" do
      post :create, winner: p1.id, loser: p2.id, game_type: "EightBall"

      response.should redirect_to("/")
    end
  end
end
