class AddGamesTable < ActiveRecord::Migration
  def up
    create_table :games do |t|
      t.integer :winner_id
      t.integer :loser_id
      t.integer :winner_rating
      t.integer :loser_rating
      t.string :type
    end
  end

  def down
    drop_table :games
  end
end
