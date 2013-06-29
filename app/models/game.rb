class Game < ActiveRecord::Base
  attr_accessible :meta, :type
  has_many :result

  def self.record(type, winner, loser, meta = {})
    game = create_game(type, meta)
    create_results(winner, loser, game)
  end

  private

  def self.create_game(type, meta)
    Game.create type: type, meta: MultiJson.dump(meta)
  end

  def self.create_results(winner, loser, game)
    elo_winner = Elo::Player.new rating: winner.rating, games_played: winner.games_played
    elo_loser = Elo::Player.new rating: loser.rating, games_played: loser.games_played
    elo_winner.wins_from elo_loser

    Result.create player: winner, won: true, rating_after: elo_winner.rating, game: game
    Result.create player: loser, won: false, rating_after: elo_loser.rating, game: game
  end
end
