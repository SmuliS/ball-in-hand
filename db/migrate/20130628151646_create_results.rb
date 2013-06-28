class CreateResults < ActiveRecord::Migration
  def change
    create_table :results do |t|
      t.references :player
      t.boolean :won
      t.integer :rating_after

      t.timestamps
    end
    add_index :results, :player_id
  end
end
