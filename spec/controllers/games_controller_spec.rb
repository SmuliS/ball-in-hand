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
        post :create, winner: p1.id, winner_secret_key: p1.secret_key, loser: p2.id, loser_secret_key: p2.secret_key, game_type: "EightBall"
      }.to change{Game.count}.by(1)
    end

    it "should redirect to main page" do
      post :create, winner: p1.id, winner_secret_key: p1.secret_key, loser: p2.id, loser_secret_key: p2.secret_key, game_type: "EightBall"

      response.should redirect_to("/")
    end
    describe "it should check secret_keys" do
      context "valid keys" do
        it "should record a game" do
          post :create, winner: p1.id, winner_secret_key: p1.secret_key, loser: p2.id, loser_secret_key: p2.secret_key, game_type: "EightBall"
          response.should redirect_to("/")
        end
      end
      context "invalid keys" do
        it "should not record a game" do
          expect{
            post :create, winner: p1.id, winner_secret_key: "wrong_key", loser: p2.id, loser_secret_key: p2.secret_key, game_type: "EightBall"
          }.to change{Game.count}.by(0)
        end
      end
    end
    it "should render new if winner and loser are same" do
      post :create, winner: p1.id, winner_secret_key: p1.secret_key, loser: p1.id, loser_secret_key: p1.secret_key, game_type: "EightBall"
      response.should render_template :new
    end
  end
end
