class AddSecretKeyToPlayer < ActiveRecord::Migration
  def up
    add_column :players, :secret_key, :string
  end
  def down
    remove_column :players, :secret_key, :string
  end
end
