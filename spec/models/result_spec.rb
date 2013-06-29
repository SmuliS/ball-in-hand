require 'spec_helper'

describe Result do
  let(:p1) { create :player}
  let(:p2) { create :player}

  it "should get correct opponent" do
    Game.record "EightBall", p1, p2
    p1.results.last.opponent.should eq(p2)
  end
end
