require 'spec_helper'

describe PlayersController do
  let(:player) { create(:player)}

  describe "#show" do
    it "should assign player" do
      post :show, id: player.id
      assigns(:player).should be_valid
    end
  end
end
