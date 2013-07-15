class GamesController < ApplicationController
  def index
    @players = Player.all.sort_by { |player| - player.rating}
  end

  def new
    @players = Player.all
  end

  def create
    winner = params[:winner].to_i
    winner_secret_key = params[:winner_secret_key]
    loser  = params[:loser].to_i
    loser_secret_key = params[:loser_secret_key]
    game_type = params[:game_type].to_s

    winner = Player.find(winner)
    loser = Player.find(loser)

    authenticated = winner.secret_key == winner_secret_key && loser.secret_key == loser_secret_key

    if winner != loser && authenticated
      Game.record game_type, winner, loser
      redirect_to "/" # TODO: RETURN 200 AND SOME FANCY JSON FOR BACKBONE
    else
      # TODO: Error message
      @players = Player.all
      render :new
    end
  end
end
