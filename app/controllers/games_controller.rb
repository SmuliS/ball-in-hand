class GamesController < ApplicationController
  def index
    @players = Player.all.sort_by { |player| - player.rating}
  end

  def new
    @players = Player.all
  end

  def create
    winner = params[:winner].to_i
    loser  = params[:loser].to_i
    game_type = params[:game_type].to_s

    winner = Player.find(winner)
    loser = Player.find(loser)

    if winner != loser
      Game.record game_type, winner, loser
      redirect_to "/" # TODO: RETURN 200 AND SOME FANCY JSON FOR BACKBONE
    else
      # TODO: Error message
      @players = Player.all
      render :new
    end
  end
end
