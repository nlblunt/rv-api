class AddToRvpark081419 < ActiveRecord::Migration[5.2]
  def change
    add_column :rvparks, :cash, :boolean
    add_column :rvparks, :boating, :boolean
    add_column :rvparks, :biking, :boolean
    add_column :rvparks, :swimmingpool, :boolean
    add_column :rvparks, :gps, :string
  end
end
