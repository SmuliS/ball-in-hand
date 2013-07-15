class Player < ActiveRecord::Base
  attr_accessible :name
  attr_accessible :secret_key
  has_many :results

  validates_presence_of :name, :secret_key

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
