class Player < ActiveRecord::Base
  attr_accessible :name
  has_many :results

  def rating
    last_result = results.last

    if last_result
      results.last.rating_after
    else
      1000 # Default rating (Magic number, I know :(
    end
  end

  def games_played
    results.count
  end
end
