require 'spec_helper'

describe Player do
  let(:player) { build(:player) } 
  it "should have valid factory" do
    player.should be_valid
  end
  describe "validations" do
    it "should validate presence" do
      build(:player, name: nil).should_not be_valid
    end 
  end
end