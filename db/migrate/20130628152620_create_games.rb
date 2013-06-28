class CreateGames < ActiveRecord::Migration
  def change
    create_table :games do |t|
      t.string :type
      t.text :meta

      t.timestamps
    end
  end
end
