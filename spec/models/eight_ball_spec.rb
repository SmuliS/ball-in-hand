require 'spec_helper'

describe EightBall do
  it "should create object from type" do
    game = Game.create type: "EightBall"

    eight_ball_game = Game.find(game.id)
    eight_ball_game.should be_valid
  end

  it "should not create object from invalid type" do
    game = Game.create type: "FooBall"

    expect{Game.find(game)}.to raise_error ActiveRecord::SubclassNotFound
  end
end
