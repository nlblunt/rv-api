class AddToRvparkFeatures < ActiveRecord::Migration[5.2]
  def change
    add_column :rvparks, :grass, :boolean
    add_column :rvparks, :outdoorsports, :boolean
    add_column :rvparks, :beach, :boolean
    add_column :rvparks, :dayuse, :boolean
    add_column :rvparks, :militarydiscount, :boolean
    add_column :rvparks, :slideouts, :boolean
    add_column :rvparks, :freeshowers, :boolean
  end
end
