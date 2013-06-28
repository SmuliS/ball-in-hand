class GamesController < ApplicationController

  def create
    winner_name = params[:winner].to_s
    loser_name = params[:loser].to_s
    game_type = params[:game_type].to_s

    winner = Player.find_by_name(winner_name)
    loser = Player.find_by_name(loser_name)

    Game.record game_type, winner, loser
    redirect_to "/" # TODO: RETURN 200 AND SOME FANCY JSON FOR BACKBONE
  end
end
