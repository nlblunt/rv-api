class AddToRvpark081519 < ActiveRecord::Migration[5.2]
  def change
    add_column :rvparks, :seasonal, :boolean
    add_column :rvparks, :groupvenue, :boolean
  end
end
